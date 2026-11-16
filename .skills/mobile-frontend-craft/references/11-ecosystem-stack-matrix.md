# 11: Ultimate Cross-Platform & Mobile Ecosystem Matrix

This manual provides the definitive architectural selection matrix, tier rankings, and implementation standards for all major libraries across 25+ production frontend domains.

---

## 🏛️ Comprehensive Ecosystem Selection Matrix

| Domain Category | Tier 1 (Production Default) | Tier 2 (Specialized / Enterprise) | Anti-Slop Architectural Guidance |
| :--- | :--- | :--- | :--- |
| **1. Styling & Tokens** | **NativeWind v4, Unistyles, Tamagui** | Dripsy, Restyle, RN StyleSheet | Gunakan NativeWind/Unistyles untuk token universal. Hindari Emotion/styled-components di mobile karena overhead runtime CSS-in-JS tinggi. |
| **2. Headless Primitives** | **React Native Reusables, RN Primitives** | React Native Aria, Tamagui Primitives, NativeWind UI | Bangun di atas headless primitives yang menggaransi WAI-ARIA dan keyboard/screen-reader accessibility penuh. |
| **3. UI Component Kits** | **shadcn/ui (Web), RN Reusables, gluestack-ui** | React Native Paper, UI Kitten, Tamagui | Hindari komponen monolitik kaku (NativeBase legacy / Material Kit). Selalu prioritaskan komponen copy-paste yang dapat di-override token-nya. |
| **4. Animation & Physics** | **React Native Reanimated 3+, Motion (Web)** | React Native Skia, Moti, Rive, Lottie | Animasi wajib berjalan di UI thread (60–120fps worklets). Gunakan Skia untuk shader/canvas kustom dan Rive untuk vektor interaktif mikro. |
| **5. Gesture Systems** | **React Native Gesture Handler** | RN Draggable FlatList, RN Swipeable | Selalu bungkus root app dengan `GestureHandlerRootView`. Gabungkan dengan Reanimated untuk respon gestur instan tanpa lag di JS thread. |
| **6. Bottom Sheet / Modal** | **`@gorhom/bottom-sheet`** | React Native Actions Sheet, Modalize | Wajib `@gorhom/bottom-sheet` untuk lembar modal bersnap-point dinamis dengan performa 120 FPS native gesture tracking. |
| **7. Navigation & Routing** | **Expo Router (File-based), Solito** | React Navigation, RN Navigation | Expo Router v3+ dengan typed routes, deep linking otomatis, dan integrasi Solito untuk berbagi rute antara Next.js dan Expo. |
| **8. Icons** | **Lucide Icons, Phosphor Icons** | Tabler Icons, Heroicons, Hugeicons | Seragamkan `strokeWidth` (1.75–2.0) di seluruh layar. Jangan mencampur-aduk FontAwesome, Material, dan Emoji dalam 1 aplikasi. |
| **9. Forms & Validation** | **React Hook Form + Zod / Valibot** | TanStack Form, Superstruct | DILARANG form laggy berbasis 10 `useState` atau Formik legacy. Pasang Maskito/IMask untuk input mata uang/nomor rekening tanpa kursor loncat. |
| **10. Lists & Virtualization** | **`@shopify/flash-list`, Legend List** | TanStack Virtual, RecyclerListView | Wajib FlashList untuk list $>50$ item. Daur ulang sel native (recycling) mencegah konsumsi memori membengkak (OOM crash). |
| **11. Charts & Analytics** | **Victory Native (XL / Skia), Gifted Charts** | Apache ECharts, Recharts, RN Skia | Semua angka sumbu grafik wajib `tabular-nums`. Gunakan Gifted Charts atau Victory Native untuk interaksi tooltip berbasis sentuhan halus. |
| **12. Date & Calendar** | **`@internationalized/date`, RN Calendars** | RN DateTimePicker, RN Modern Datepicker | Selalu gunakan `@internationalized/date` untuk kalkulasi tanggal bebas bug zona waktu/kabisat sebelum dilempar ke komponen kalender. |
| **13. Maps & Location** | **MapLibre React Native, Mapbox** | react-native-maps, Google Maps SDK | Gunakan clustering untuk marker $\ge 50$ titik dan throttle update GPS (2–5 detik) untuk menghemat baterai perangkat. |
| **14. Storage & Offline DB** | **MMKV (K-V), Expo SecureStore (Tokens)** | WatermelonDB, SQLite / Expo SQLite | MMKV 30x lebih cepat dari AsyncStorage. Kredensial & PIN wajib di SecureStore (Keychain/Keystore). Data relasional offline wajib WatermelonDB/SQLite. |
| **15. Client State** | **Zustand, Legend-State, Jotai** | Redux Toolkit (Enterprise RTK), Valtio | Zustand sebagai store global default; Legend-State untuk reaktivitas atomik tanpa re-render; RTK hanya jika audit trail / time-travel diwajibkan klien. |
| **16. Server State & API** | **TanStack Query v5, tRPC, Ky / Axios** | SWR, Apollo Client, Supabase, Firebase | TanStack Query wajib untuk server cache, deduplikasi request, dan background sync. Pasang tRPC untuk end-to-end fullstack type safety. |
| **17. Image Processing** | **Expo Image, `@d11/react-native-fast-image`** | RN Image Crop Picker, Expo Manipulator | Wajib placeholder **BlurHash / ThumbHash**, disk caching otomatis, dan kompresi resolusi gambar sebelum di-upload ke CDN. |
| **18. Video, Audio & Camera** | **RN Vision Camera, Expo Video, Expo AV** | React Native Video, Expo Camera | Vision Camera untuk pemrosesan frame AI/barcode berkecepatan 60fps; Expo Video untuk streaming playback modern. |
| **19. Authentication** | **Better Auth, Clerk, Supabase Auth** | Auth0, Firebase Auth, Expo AuthSession | Silent token refresh mutex wajib dipasang. Sediakan integrasi Apple Sign-In dan Google Sign-In via AuthSession. |
| **20. Push Notifications** | **Expo Notifications, Notifee** | OneSignal, Firebase Cloud Messaging | Tangani 3 lifecycle notifikasi: *Killed State*, *Background*, dan *Foreground* banner dengan routing deep link instan ke layar tujuan. |
| **21. Payment Gateways** | **Midtrans, Xendit (Lokal ID/SEA)** | Stripe React Native, RevenueCat (IAP) | Midtrans/Xendit via Snap/In-App WebView tokenized untuk QRIS & VA; Stripe & RevenueCat untuk subscription dan Google Play / App Store IAP. |
| **22. Testing & Quality** | **Maestro (Mobile E2E), Jest, RNTL** | Playwright (Web), Detox | Maestro untuk automated mobile UI testing berbasis YAML yang tidak rapuh; Jest + React Native Testing Library untuk unit & integration test. |
| **23. Platform & Tooling** | **Expo (Managed / Prebuild), EAS** | Expo Modules API, Expo Dev Client | Gunakan Expo Config Plugins untuk menghubungkan kode native pihak ketiga tanpa merusak workflow managed EAS Build. |
| **24. Accessibility (a11y)** | **React Native Accessibility, RN Aria** | Tamagui Accessibility, RN A11y Engine | Dynamic Type scaling hingga 200%, semantic roles, dan `accessibilityLabel` wajib pada setiap tombol interaktif. |
| **25. Cross-Platform Unified**| **Solito (Next.js + Expo), React Native Web** | Tamagui, Tauri, Electron | Berbagi 90%+ logika bisnis, validasi form Zod, dan store Zustand antara aplikasi Web dan Mobile dalam monorepo Turborepo. |
| **26. Design & Inspiration** | **shadcn/ui, Aceternity UI, Magic UI, Mobbin** | 21st.dev, Refero, Page Flows, Tremor | Rujuk Mobbin / Page Flows untuk alur UX nyata aplikasi top dunia; rujuk Aceternity / Magic UI untuk efek visual modern berkelas. |

---

## 💻 Blueprint Komponen Kritis Lintas Ekosistem

### 1. High-Performance Bottom Sheet (`@gorhom/bottom-sheet`)
```tsx
import React, { useMemo, useRef, useCallback } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import BottomSheet, { BottomSheetBackdrop, BottomSheetView } from '@gorhom/bottom-sheet';

export const InteractiveSheet: React.FC<{ isOpen: boolean; onClose: () => void; children: React.ReactNode }> = ({
  isOpen,
  onClose,
  children,
}) => {
  const bottomSheetRef = useRef<BottomSheet>(null);
  const snapPoints = useMemo(() => ['25%', '50%', '85%'], []);

  const renderBackdrop = useCallback(
    (props: any) => <BottomSheetBackdrop {...props} disappearsOnIndex={-1} appearsOnIndex={0} opacity={0.4} />,
    []
  );

  return (
    <BottomSheet
      ref={bottomSheetRef}
      index={isOpen ? 1 : -1}
      snapPoints={snapPoints}
      enablePanDownToClose
      onClose={onClose}
      backdropComponent={renderBackdrop}
      handleIndicatorStyle={{ backgroundColor: '#94A3B8', width: 44, height: 5 }}
      backgroundStyle={{ backgroundColor: '#FFFFFF', borderRadius: 28 }}
    >
      <BottomSheetView style={styles.contentContainer}>{children}</BottomSheetView>
    </BottomSheet>
  );
};

const styles = StyleSheet.create({
  contentContainer: { flex: 1, padding: 20 },
});
```

---

### 2. High-Speed Synchronous Storage with MMKV
```typescript
import { MMKV } from 'react-native-mmkv';

export const appStorage = new MMKV({
  id: 'mobilecraft-app-storage',
  encryptionKey: 'user-secure-local-entropy', // Optional hardware encryption
});

// Fast synchronous read/write (30x faster than AsyncStorage)
export const StorageHelper = {
  set: (key: string, value: any) => appStorage.set(key, JSON.stringify(value)),
  get: <T>(key: string): T | null => {
    const val = appStorage.getString(key);
    return val ? (JSON.parse(val) as T) : null;
  },
  remove: (key: string) => appStorage.delete(key),
};
```

---

### 3. Payment Orchestration: Midtrans / Xendit (SEA) & Stripe (Global)
```typescript
// src/lib/payments/paymentOrchestrator.ts
export type PaymentGateway = 'midtrans' | 'xendit' | 'stripe';

export interface CheckoutPayload {
  orderId: string;
  grossAmount: number;
  customerName: string;
  customerEmail: string;
}

export const PaymentEngine = {
  async initiateCheckout(gateway: PaymentGateway, payload: CheckoutPayload) {
    switch (gateway) {
      case 'midtrans':
        // Generate Snap Token from backend and invoke Snap WebView or Mobile SDK
        const { snapToken, redirectUrl } = await fetch('/api/payments/midtrans/snap', {
          method: 'POST',
          body: JSON.stringify(payload),
        }).then((res) => res.json());
        return { type: 'webview', url: redirectUrl, token: snapToken };

      case 'xendit':
        // Generate Xendit Invoice with QRIS / Virtual Account support
        const { invoiceUrl } = await fetch('/api/payments/xendit/invoice', {
          method: 'POST',
          body: JSON.stringify(payload),
        }).then((res) => res.json());
        return { type: 'webview', url: invoiceUrl };

      case 'stripe':
        // Stripe PaymentSheet integration
        const { paymentIntent, ephemeralKey, customer } = await fetch('/api/payments/stripe/intent', {
          method: 'POST',
          body: JSON.stringify(payload),
        }).then((res) => res.json());
        return { type: 'native_sheet', paymentIntent, ephemeralKey, customer };
    }
  },
};
```

---

### 4. Vision Camera & Barcode/QR Scanner Pipeline
```tsx
import React, { useEffect, useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Camera, useCameraDevice, useCodeScanner } from 'react-native-vision-camera';

export const FastQRScanner: React.FC<{ onScanned: (code: string) => void }> = ({ onScanned }) => {
  const device = useCameraDevice('back');
  const [hasPermission, setHasPermission] = useState(false);

  useEffect(() => {
    Camera.requestCameraPermission().then((status) => setHasPermission(status === 'granted'));
  }, []);

  const codeScanner = useCodeScanner({
    codeTypes: ['qr', 'ean-13'],
    onCodeScanned: (codes) => {
      if (codes.length > 0 && codes[0].value) {
        onScanned(codes[0].value);
      }
    },
  });

  if (!hasPermission || !device) {
    return <View style={styles.fallback}><Text>Meminta akses kamera...</Text></View>;
  }

  return <Camera style={StyleSheet.absoluteFill} device={device} isActive={true} codeScanner={codeScanner} />;
};

const styles = StyleSheet.create({
  fallback: { flex: 1, alignItems: 'center', justifyContent: 'center' },
});
```

---

### 5. Unified Cross-Platform Navigation with Solito & Expo Router
```tsx
// src/navigation/SolitoLink.tsx
import React from 'react';
import { Text } from 'react-native';
import { Link as SolitoLink } from 'solito/link';

// Seamlessly works on Next.js (SSR anchor) and Expo (React Navigation transition)
export const UniversalNavLink: React.FC<{ href: string; title: string }> = ({ href, title }) => {
  return (
    <SolitoLink href={href}>
      <Text style={{ fontSize: 14, fontWeight: '700', color: '#2563EB' }}>{title}</Text>
    </SolitoLink>
  );
};
```
