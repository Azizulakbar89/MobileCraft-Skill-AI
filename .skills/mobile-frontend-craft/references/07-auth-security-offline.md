# 07: Auth, Security, Token Mutex & Offline-First Sync

This manual establishes enterprise security standards, concurrent token refresh mutex, biometric authentication, and offline-first data synchronization.

---

## 1. Silent Token Refresh Mutex (Anti-Race Condition)

In complex apps, opening a screen triggers multiple concurrent API requests (e.g. user profile, notifications, wallet balance). If the JWT access token expires, multiple parallel requests will hit `401 Unauthorized`. 

**The Sin:** Every failing request independently calls the refresh endpoint, generating 5 refresh calls, invalidating rotating refresh tokens, and forcing an unwanted user logout.
**The Fix:** A singleton Promise Mutex with an in-memory failed request subscriber queue.

```typescript
// src/lib/api/httpClient.ts
import axios, { AxiosError, InternalAxiosRequestConfig } from 'axios';
import { getAccessToken, getRefreshToken, saveTokens, clearTokens } from './secureStorage';

export const api = axios.create({
  baseURL: process.env.EXPO_PUBLIC_API_URL || '/api',
  timeout: 15000,
});

let isRefreshing = false;
let failedQueue: Array<{
  resolve: (token: string) => void;
  reject: (error: any) => void;
}> = [];

const processQueue = (error: any, token: string | null = null) => {
  failedQueue.forEach((promise) => {
    if (token) {
      promise.resolve(token);
    } else {
      promise.reject(error);
    }
  });
  failedQueue = [];
};

api.interceptors.request.use(async (config: InternalAxiosRequestConfig) => {
  const token = await getAccessToken();
  if (token && config.headers) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

api.interceptors.response.use(
  (response) => response,
  async (error: AxiosError) => {
    const originalRequest = error.config as InternalAxiosRequestConfig & { _retry?: boolean };

    if (error.response?.status === 401 && !originalRequest._retry) {
      if (isRefreshing) {
        // Queue parallel requests until refresh completes
        return new Promise((resolve, reject) => {
          failedQueue.push({
            resolve: (token: string) => {
              if (originalRequest.headers) {
                originalRequest.headers.Authorization = `Bearer ${token}`;
              }
              resolve(api(originalRequest));
            },
            reject: (err: any) => reject(err),
          });
        });
      }

      originalRequest._retry = true;
      isRefreshing = true;

      try {
        const refreshToken = await getRefreshToken();
        if (!refreshToken) throw new Error('No refresh token available');

        const { data } = await axios.post('/api/auth/refresh', { refreshToken });
        await saveTokens(data.accessToken, data.refreshToken);

        processQueue(null, data.accessToken);
        if (originalRequest.headers) {
          originalRequest.headers.Authorization = `Bearer ${data.accessToken}`;
        }
        return api(originalRequest);
      } catch (refreshErr) {
        processQueue(refreshErr, null);
        await clearTokens();
        // Redirect to Login via global navigation event
        window.dispatchEvent(new CustomEvent('auth:session-expired'));
        return Promise.reject(refreshErr);
      } finally {
        isRefreshing = false;
      }
    }

    return Promise.reject(error);
  }
);
```

---

## 2. Secure Storage & Biometric Authentication

**DILARANG:** Storing user session tokens, PINs, or confidential IDs in unencrypted `localStorage` (Web) or plain `AsyncStorage` (React Native).

### Storage Standard:
- **Mobile (React Native / Expo):** `expo-secure-store` (backed by iOS Keychain and Android KeyStore with hardware AES-256).
- **Web:** Encrypted HttpOnly Cookies with `SameSite=Strict; Secure`. For client-side offline data, use WebCrypto-encrypted IndexedDB.

### Biometric Gate Pattern (Expo / React Native):
```typescript
import * as LocalAuthentication from 'expo-local-authentication';

export async function authenticateWithBiometrics(reason = 'Konfirmasi transaksi Anda'): Promise<boolean> {
  const hasHardware = await LocalAuthentication.hasHardwareAsync();
  const isEnrolled = await LocalAuthentication.isEnrolledAsync();

  if (!hasHardware || !isEnrolled) {
    // Fallback to Secure PIN screen
    return false;
  }

  const result = await LocalAuthentication.authenticateAsync({
    promptMessage: reason,
    cancelLabel: 'Batal',
    disableDeviceFallback: false,
  });

  return result.success;
}
```

---

## 3. Role-Based Access Control (RBAC) & Route Guards

```tsx
// src/components/auth/RouteGuard.tsx
import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useAuthStore } from '@/stores/authStore';

export type UserRole = 'admin' | 'supervisor' | 'courier' | 'customer';

interface RouteGuardProps {
  children: React.ReactNode;
  allowedRoles?: UserRole[];
}

export const RouteGuard: React.FC<RouteGuardProps> = ({ children, allowedRoles }) => {
  const { isAuthenticated, user, isInitialized } = useAuthStore();
  const location = useLocation();

  if (!isInitialized) {
    return <div class="min-h-screen flex items-center justify-center bg-slate-50"><div class="animate-spin w-8 h-8 border-4 border-blue-600 rounded-full border-t-transparent" /></div>;
  }

  if (!isAuthenticated || !user) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  if (allowedRoles && !allowedRoles.includes(user.role)) {
    return <Navigate to="/unauthorized" replace />;
  }

  return <>{children}</>;
};
```

---

## 4. Offline-First Mutation Queue with Optimistic Rollback

For POS, field workers, couriers, or spotty mobile connections, mutations must execute locally first, update the UI instantly, and sync when back online.

```typescript
// src/lib/offline/mutationQueue.ts
import { create } from 'zustand';
import { persist, createJSONStorage } from 'zustand/middleware';
import { api } from '@/lib/api/httpClient';

export interface PendingMutation {
  id: string;
  endpoint: string;
  method: 'POST' | 'PUT' | 'DELETE';
  payload: any;
  timestamp: number;
  retryCount: number;
}

interface OfflineQueueStore {
  queue: PendingMutation[];
  enqueue: (mutation: Omit<PendingMutation, 'id' | 'timestamp' | 'retryCount'>) => string;
  dequeue: (id: string) => void;
  processQueue: () => Promise<void>;
}

export const useOfflineQueue = create<OfflineQueueStore>()(
  persist(
    (set, get) => ({
      queue: [],
      enqueue: (data) => {
        const id = `mut_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`;
        set((state) => ({
          queue: [...state.queue, { ...data, id, timestamp: Date.now(), retryCount: 0 }],
        }));
        return id;
      },
      dequeue: (id) => {
        set((state) => ({ queue: state.queue.filter((m) => m.id !== id) }));
      },
      processQueue: async () => {
        const { queue, dequeue } = get();
        if (queue.length === 0 || !navigator.onLine) return;

        for (const item of queue) {
          try {
            await api.request({ url: item.endpoint, method: item.method, data: item.payload });
            dequeue(item.id);
          } catch (err: any) {
            if (err.response?.status >= 400 && err.response?.status < 500) {
              // Client error: cannot be retried, notify user and dequeue to prevent blocking
              dequeue(item.id);
              window.dispatchEvent(new CustomEvent('offline:sync-failed', { detail: { item, error: err } }));
            }
            break; // Stop queue processing if network fails again
          }
        }
      },
    }),
    { name: 'app-offline-mutation-queue' }
  )
);

// Auto-trigger sync when connectivity resumes
if (typeof window !== 'undefined') {
  window.addEventListener('online', () => {
    useOfflineQueue.getState().processQueue();
  });
}
```
