# 10: Multi-Domain Archetypes & Curated Resource Directory

This manual provides domain-specific UI/UX blueprints across 5 complex industries and a curated directory of production-grade tools, libraries, and design resources.

---

## Part 1: The 5 Complex Domain Archetypes

### 1. Fintech, Banking & Crypto
- **Balance Privacy Eye Toggle:** Users must be able to obscure their financial balance (`Rp ••••••••`) with a single tap in the header.
- **Tabular Figures & Currency Masking:** Every monetary amount must use `tabular-nums` and real-time formatting (e.g. `1.500.000`) without cursor jumping.
- **App Inactivity Privacy Shield:** When the app is minimized / sent to the background, overlay a secure blur screen to prevent iOS/Android task switchers from taking screenshots of sensitive financial data.

### 2. E-Commerce & Marketplace
- **Variant Selection Matrix:** Dynamic disabling of out-of-stock combinations (e.g. Color: Black $\times$ Size: XL).
- **Sticky Thumb-Zone Checkout Bar:** Fixed at the bottom 35% with total price, discounts, and high-contrast CTA button.
- **Micro-Urgency Timers:** Flash sale countdown with fixed-width tabular numbers (`02:14:59`) so seconds ticking does not cause layout jitter.

### 3. SuperApp, Maps & On-Demand Logistics
- **3-Stage Bottom Sheet:** Smooth gesture snapping between Collapsed (search bar visible), Half (nearby drivers/vendors), and Expanded (full filter list).
- **Location Throttling:** Throttle GPS coordinate updates to 2–5 seconds with path interpolation to avoid battery drain and jerky marker movement.
- **Proof-of-Delivery:** Client-side camera capture with auto-compression (under 300KB) and background retry queue.

### 4. Chat, Social Media & Live Feed
- **Keyboard-Docked Expanding Input:** Auto-grow textarea up to 5 lines while staying pinned immediately above the virtual keyboard without layout jump.
- **Swipe-to-Reply & Tactile Haptics:** Light haptic vibration on reaching swipe threshold (64px) with spring snap-back.
- **Viewport Video Lifecycle:** Intersection Observer / `onViewableItemsChanged` that automatically pauses video streams when scrolled out of view to preserve RAM and data.

### 5. Enterprise SaaS, POS (Kasir) & Field ERP
- **Offline Cashier Mode:** Complete barcode scan, cart calculation, and local receipt generation while completely disconnected from internet.
- **Multi-Condition Filter Sheets:** Filter by date range, branch, status, and price inside a clean modal bottom sheet rather than cramming dropdowns on a small screen.
- **Bulk Selection Bar:** Bottom floating action bar that appears when $\ge 1$ item is selected (Print, Export CSV, Mark Completed, Delete).

---

## Part 2: Curated Resource Directory for World-Class Frontend Craft

Whenever building interfaces or refining tokens, reference these industry-standard resources:

### A. Vector Iconography & Crisp Illustration
- **Lucide Icons (`https://lucide.dev`):** The primary MobileCraft standard. 1,400+ vector icons with uniform 1.75–2.0 stroke width, zero runtime bloat.
- **Phosphor Icons (`https://phosphoricons.com`):** 6 versatile weights (Thin, Light, Regular, Bold, Fill, Duotone).
- **Tabler Icons (`https://tabler.io/icons`):** 5,000+ detailed technical icons for enterprise dashboards and ERPs.
- **Heroicons (`https://heroicons.com`):** Crafted by Tailwind Labs, optimized for modern 20px and 24px UI grids.
- **unDraw (`https://undraw.co`):** Open-source customizable SVG illustrations for Empty and Success states.
- **Storyset (`https://storyset.com`):** High-quality vector illustration concepts for onboarding and error recovery screens.

### B. Color Systems, APCA Contrast & Token Calculators
- **Realtime Colors (`https://www.realtimecolors.com`):** Test color palettes on real UI templates before writing code.
- **Radix Colors (`https://www.radix-ui.com/colors`):** Accessible, balanced 12-step color scales for Light and Dark modes.
- **OKLCH Color Picker (`https://oklch.com`):** Perceptual color space for uniform brightness across all hues.
- **UI Colors (`https://uicolors.app`):** Generate complete 50–950 Tailwind palette shades from a single brand hex.
- **APCA Contrast Calculator (`https://www.myndex.com/APCA/`):** Next-generation readability and spatial contrast standard.
- **Coolors (`https://coolors.co`):** Rapid harmonic palette exploration and export.

### C. Typography & Typescale Systems
- **Fontshare (`https://www.fontshare.com`):** Elite free typography by Indian Type Foundry (Satoshi, General Sans, Plus Jakarta Sans, Clash Display).
- **Google Fonts (`https://fonts.google.com`):** Reliable global webfonts (Inter, Plus Jakarta Sans, JetBrains Mono).
- **Typescale (`https://typescale.com`):** Mathematical typographic hierarchy calculator (Major Third, Perfect Fourth).
- **Fontpair (`https://www.fontpair.co`):** Proven heading and body font pairings.

### D. Motion Physics & Vector Animation
- **Motion (`https://motion.dev`):** Industry standard spring physics and gesture animation for React and modern web.
- **Rive (`https://rive.app`):** State-machine driven, ultra-lightweight interactive vector animations (replaces heavy MP4/GIFs).
- **LottieFiles (`https://lottiefiles.com`):** Vector JSON micro-interactions for loaders and payment celebration confetti.
- **Easings.net (`https://easings.net`):** Visual catalog of cubic-bezier curves for responsive CSS and JS transitions.

### E. Real-World Mobile UX Standards
- **Mobbin (`https://mobbin.com`):** Over 300,000 real iOS and Android production screenshots and user flows (Stripe, Airbnb, Revolut).
- **Apple Human Interface Guidelines (`https://developer.apple.com/design/human-interface-guidelines/`):** Official iOS standards.
- **Material Design 3 (`https://m3.material.io/`):** Official Android dynamic token and elevation specifications.
- **Component Gallery (`https://component.gallery`):** Comprehensive collection of UI components from leading design systems.
