# 05: UI/UX Libraries, Color Palettes, Icons & App Layout Blueprints

This reference provides ready-to-use color palettes, icon libraries, UI styling libraries, and screen layout blueprints for common mobile app categories.

---

## 1. Curated Mobile Color Palettes (Light & Dark)

Pick **one** palette that fits the app's domain. Never mix neon gradients or rainbow pastel boxes into these palettes.

### A. Editorial Light (Fintech, Banking, Productivity)
- **Canvas:** `#F5F5F7`
- **Surface (Cards/Sheets):** `#FFFFFF`
- **Primary Text:** `#111827`
- **Secondary Text:** `#6B7280`
- **Primary Accent:** `#111827` (Charcoal)
- **Positive / Income:** `#047857` (Forest Emerald)
- **Negative / Error:** `#DC2626`
- **Hairline Divider:** `rgba(17, 24, 39, 0.08)`

### B. Crisp Cobalt (E-Commerce, Travel, Booking)
- **Canvas:** `#F8FAFC`
- **Surface:** `#FFFFFF`
- **Primary Text:** `#0F172A`
- **Secondary Text:** `#64748B`
- **Primary Accent:** `#2563EB` (Cobalt Blue)
- **Accent Soft Tint:** `#EFF6FF`
- **Hairline Divider:** `rgba(15, 23, 42, 0.07)`

### C. Warm Paper (Food, Lifestyle, Reading)
- **Canvas:** `#FAF8F5`
- **Surface:** `#FFFFFF`
- **Primary Text:** `#1C1917`
- **Secondary Text:** `#78716C`
- **Primary Accent:** `#C2410C` (Terracotta)
- **Accent Soft Tint:** `#FFF7ED`
- **Hairline Divider:** `rgba(28, 25, 23, 0.08)`

### D. True OLED Dark (Media, Music, Crypto, Maps)
- **Canvas:** `#000000` or `#09090B`
- **Surface:** `#141417`
- **Elevated (Sheets/Modals):** `#1C1C21`
- **Primary Text:** `#FAFAFA`
- **Secondary Text:** `#A1A1AA`
- **Primary Accent:** `#10B981` (Emerald) or `#3B82F6` (Blue)
- **Hairline Divider:** `rgba(255, 255, 255, 0.08)`

---

## 2. Icon Libraries (1 Family per Project)

Enforce **one** icon family across the entire app with consistent stroke width (`1.75`–`2.0`).

| Library | Best For | Package / Source |
| :--- | :--- | :--- |
| **Lucide Icons** | Default cross-platform & prototypes | `lucide-react-native`, `lucide-flutter`, `lucide.dev` |
| **Phosphor Icons** | Apps needing outline + filled active tab states | `phosphor-react-native`, `phosphor_flutter` |
| **Apple SF Symbols** | Native iOS (SwiftUI) | Built-in `Image(systemName: "...")` |
| **Google Material Symbols** | Native Android (Compose) & Flutter M3 | `fonts.google.com/icons` |
| **Tabler / Heroicons** | Clean utility & SaaS mobile interfaces | `tabler.io/icons`, `heroicons.com` |

---

## 3. UI & Styling Libraries by Mobile Platform

| Platform | Styling & Tokens | Components, Sheets & Motion |
| :--- | :--- | :--- |
| **React Native (Expo)** | `nativewind` v4, `react-native-unistyles` | `react-native-reusables`, `@gorhom/bottom-sheet`, `react-native-reanimated`, `react-native-gesture-handler`, `@shopify/flash-list`, `expo-haptics`, `react-native-safe-area-context` |
| **Flutter (Dart)** | Material 3 `ThemeData` / `CupertinoThemeData` | `SliverAppBar`, `showModalBottomSheet`, `AnimatedScale`, `HapticFeedback`, `CustomScrollView` |
| **SwiftUI (iOS)** | `Color` assets + `ViewModifier` | `NavigationStack`, `.presentationDetents`, `.sensoryFeedback()`, `LazyVStack` |
| **Jetpack Compose (Android)** | Material 3 `ColorScheme` & `Typography` | `ModalBottomSheet`, `NavigationBar`, `WindowInsets.safeDrawing`, `LazyColumn` |
| **Mobile HTML Prototype** | Tailwind CSS + `Inter` / `Plus Jakarta Sans` | Inline SVG (Lucide), CSS `100dvh`, native `tabular-nums`, CSS spring transitions |

---

## 4. Screen Layout Blueprints by App Category

### 1. Fintech & Banking
- **Home:** Compact header (`56px`) → Hero Balance + Privacy Toggle → 4-Action Row (`Kirim`, `Isi Saldo`, `QRIS`, `Mutasi`) → Horizontal Pockets/Goals → Single Grouped Inset Card for Recent Transactions (`divide-y`) → Bottom Tab Bar (`Beranda`, `Aktivitas`, `Kartu`, `Profil`).
- **Contextual Flows:** Transfer, Top Up, and QRIS open in a bottom sheet and hide the Bottom Tab Bar.

### 2. E-Commerce & Marketplace
- **Home/Catalog:** Sticky Search Bar + Horizontal Category Pills → Featured Banner (`16:9`) → 2-Column Product Grid (`aspect-square` photo, max 2-line title, `tabular-nums` price, rating).
- **Product Detail:** Full-width image gallery → Title, price, variant selector pills → Sticky Thumb-Zone Checkout Bar (`Harga` + `"Tambah ke Keranjang"` CTA; bottom tabs hidden).

### 3. Social, Community & Chat
- **Feed:** Compact Top Bar → Horizontal Stories/Channels Rail → Clean Edge-to-Edge or Hairline-Separated Feed Posts (no heavy nested card borders) with `>= 44pt` like/comment/share targets.
- **Chat Room:** Sticky Contact Header → Scrollable Message List → Keyboard-Docked Auto-Growing Input Bar (bottom tabs hidden).

### 4. Maps, Ride-Hailing, Field Ops & Delivery
- **Booking / Command Screen:** Full-bleed real map canvas (`70%+` screen height) using keyless public tiles (e.g. **Esri World Topo** or **OpenStreetMap**, never API-key-gated tiles like CartoDB that show watermarks) → Slim Floating Filter Pills at top → Docked Bottom Sheet (`Collapsed / Half / Expanded`) for unit/address selection → Offset map `fitBounds` above the sheet so pins never hide or bunch together → Bottom tabs hidden during active booking or modal sheets.

### 5. Productivity, Health & Habit Tracker
- **Dashboard:** Large Title Header + Horizontal 7-Day Date Strip → 2-Column Summary Metrics (`tabular-nums`) → Clean Task/Habit List with `>= 48dp` rows and tactile completion toggles → Floating `+` Primary Button anchored in bottom-right thumb zone.
