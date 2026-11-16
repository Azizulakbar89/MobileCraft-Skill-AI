# 08: Real-Time Engine, Extreme Virtualization & Hardware Choreography

This manual establishes blueprints for real-time WebSocket cache injection, extreme list virtualization (50,000+ items), media pipelines, and hardware integration.

---

## 1. Real-Time WebSocket Engine & Query Cache Injection

**The Problem:** Polling servers every 2 seconds drains mobile battery and causes laggy updates.
**The Fix:** Resilient WebSocket with exponential backoff reconnection and direct injection into TanStack Query cache without triggering full page refetches.

```typescript
// src/lib/realtime/socketManager.ts
import { QueryClient } from '@tanstack/react-query';

export class RealtimeClient {
  private ws: WebSocket | null = null;
  private retryCount = 0;
  private maxRetries = 8;
  private baseDelay = 1000;
  private queryClient: QueryClient;
  private url: string;

  constructor(url: string, queryClient: QueryClient) {
    this.url = url;
    this.queryClient = queryClient;
  }

  connect() {
    this.ws = new WebSocket(this.url);

    this.ws.onopen = () => {
      this.retryCount = 0;
      console.log('⚡ Realtime connected');
    };

    this.ws.onmessage = (event) => {
      try {
        const { eventType, payload } = JSON.parse(event.data);
        this.handleEvent(eventType, payload);
      } catch (e) {
        console.error('Invalid WS payload', e);
      }
    };

    this.ws.onclose = () => {
      this.reconnect();
    };

    this.ws.onerror = (err) => {
      console.error('WS Error', err);
      this.ws?.close();
    };
  }

  private handleEvent(type: string, data: any) {
    switch (type) {
      case 'chat:new_message':
        // Direct TanStack Query cache injection (Zero refetch lag)
        this.queryClient.setQueryData<any[]>(['chat-messages', data.conversationId], (old = []) => {
          if (old.some((m) => m.id === data.id)) return old; // Deduplication
          return [...old, data];
        });
        break;

      case 'order:status_updated':
        this.queryClient.setQueryData(['order', data.orderId], (old: any) => ({
          ...old,
          status: data.newStatus,
          updatedAt: data.timestamp,
        }));
        break;
    }
  }

  private reconnect() {
    if (this.retryCount >= this.maxRetries) return;
    const delay = Math.min(this.baseDelay * 2 ** this.retryCount, 30000);
    this.retryCount++;
    setTimeout(() => this.connect(), delay);
  }

  disconnect() {
    this.ws?.close();
  }
}
```

---

## 2. Extreme Virtualization: `@shopify/flash-list` & `TanStack Virtual`

Mapping large un-virtualized lists (`data.map(...)`) causes immediate frame drops (dropping below 60fps) and OOM (Out Of Memory) crashes on mobile devices.

### React Native / Expo Standard: `@shopify/flash-list`
```tsx
import React, { useCallback } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { FlashList } from '@shopify/flash-list';

interface ProductItem {
  id: string;
  name: string;
  price: number;
}

export const VirtualProductList: React.FC<{ items: ProductItem[] }> = ({ items }) => {
  const renderItem = useCallback(({ item }: { item: ProductItem }) => (
    <View style={styles.row}>
      <Text style={styles.title}>{item.name}</Text>
      <Text style={styles.price}>Rp {item.price.toLocaleString('id-ID')}</Text>
    </View>
  ), []);

  return (
    <View style={{ flex: 1, minHeight: 400 }}>
      <FlashList
        data={items}
        renderItem={renderItem}
        estimatedItemSize={72}
        keyExtractor={(item) => item.id}
        showsVerticalScrollIndicator={false}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  row: { height: 72, paddingHorizontal: 16, justifyContent: 'center', borderBottomWidth: 1, borderBottomColor: 'rgba(0,0,0,0.05)' },
  title: { fontSize: 14, fontWeight: '600' },
  price: { fontSize: 13, color: '#2563EB', fontVariant: ['tabular-nums'] },
});
```

### Web Standard: `TanStack Virtual` with Dynamic Measurement
```tsx
import React, { useRef } from 'react';
import { useVirtualizer } from '@tanstack/react-virtual';

export const VirtualWebList: React.FC<{ items: any[] }> = ({ items }) => {
  const parentRef = useRef<HTMLDivElement>(null);

  const virtualizer = useVirtualizer({
    count: items.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 68,
    overscan: 5,
  });

  return (
    <div ref={parentRef} class="h-[600px] overflow-y-auto w-full">
      <div class="relative w-full" style={{ height: `${virtualizer.getTotalSize()}px` }}>
        {virtualizer.getVirtualItems().map((virtualRow) => {
          const item = items[virtualRow.index];
          return (
            <div
              key={virtualRow.key}
              class="absolute top-0 left-0 w-full p-4 border-b border-slate-100 flex items-center justify-between"
              style={{ transform: `translateY(${virtualRow.start}px)` }}
            >
              <span class="font-medium text-sm text-slate-800">{item.title}</span>
              <span class="font-bold tabular-nums text-sm text-blue-600">{item.metric}</span>
            </div>
          );
        })}
      </div>
    </div>
  );
};
```

---

## 3. Media Pipeline: Client-side Image Compression & BlurHash Placeholders

```typescript
// src/lib/media/imageCompressor.ts
// Browser Canvas compression before upload
export async function compressImage(file: File, maxWidth = 1280, quality = 0.82): Promise<Blob> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = (event) => {
      const img = new Image();
      img.src = event.target?.result as string;
      img.onload = () => {
        const elem = document.createElement('canvas');
        let width = img.width;
        let height = img.height;

        if (width > maxWidth) {
          height = Math.round((height * maxWidth) / width);
          width = maxWidth;
        }

        elem.width = width;
        elem.height = height;
        const ctx = elem.getContext('2d');
        ctx?.drawImage(img, 0, 0, width, height);

        elem.toBlob(
          (blob) => {
            if (blob) resolve(blob);
            else reject(new Error('Compression failed'));
          },
          'image/jpeg',
          quality
        );
      };
    };
    reader.onerror = (error) => reject(error);
  });
}
```

---

## 4. Hardware Pre-Permission Choreography & Deep Linking

**Rule:** Never directly trigger the system permission dialog (Camera/Location/Notification) on app mount. Over 60% of users deny unprompted permissions.

### Pattern: Educational Pre-Permission Modal
1. Explain WHY the app needs the permission (e.g. "We need camera access to scan QR codes for payment").
2. User taps "Lanjutkan" -> Only then trigger `requestForegroundPermissionsAsync()`.
3. If user previously selected "Don't Ask Again", redirect gracefully to System Settings with `Linking.openSettings()`.

### Deep Linking Schema (Universal / App Links):
```typescript
export const linkingConfig = {
  prefixes: ['craftlms://', 'https://craftlms.app'],
  config: {
    screens: {
      Home: '',
      CourseDetail: 'course/:courseId',
      LessonPlayer: 'course/:courseId/lesson/:lessonId',
      PaymentSuccess: 'order/:orderId/success',
    },
  },
};
```
