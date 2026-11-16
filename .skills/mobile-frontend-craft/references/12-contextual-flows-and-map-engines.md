# 12: Contextual Flows, Real-World Map Engines & Micro-Typography Hardening

This manual establishes zero-gap production standards for transactional screen lifecycles, real-world map integrations, financial micro-typography, and thumb-zone ergonomics.

---

## 1. Contextual Screen Takeover (Global Tab Bar Isolation)

**The Architectural Bug:** AI commonly leaves the global bottom navigation bar (`Home, Activity, Chat, Profile`) visible during checkout, payment, or ride-selection flows. This clutters the thumb zone, confuses users, and steals 64–84px of critical vertical viewport space.

**The Mandatory Rule:**
- Whenever a user enters an active transactional flow (selecting a vehicle, configuring cart variants, entering payment details, or running live trip tracking), the **Global Bottom Navigation Bar MUST BE FULLY HIDDEN OR UNMOUNTED**.
- The top-left back button or sheet drag-down gesture becomes the exclusive navigation mechanism to exit the flow and restore the global tab bar.

```typescript
// src/navigation/NavigationLifecycle.ts
export type FlowState = 
  | 'idle_home' 
  | 'select_vehicle' 
  | 'searching_driver' 
  | 'active_trip' 
  | 'checkout_cart' 
  | 'payment_gateway';

export function shouldShowGlobalTabs(flowState: FlowState): boolean {
  const transactionalStates: FlowState[] = [
    'select_vehicle',
    'searching_driver',
    'active_trip',
    'checkout_cart',
    'payment_gateway',
  ];
  return !transactionalStates.includes(flowState);
}
```

```tsx
// React / React Native Implementation
{shouldShowGlobalTabs(currentFlow) && (
  <BottomNavigationBar activeTab={activeTab} onTabChange={setTab} />
)}
```

---

## 2. Production Map Integration Engine (Real Tiles vs Toy Canvas)

**The Architectural Bug:** Drawing abstract gray canvas blocks and hardcoded dashed lines that look like wireframe prototypes rather than consumer apps like Gojek, Grab, or Uber.

**The Mandatory Rule:**
1. **Real Tile Engine:** Always use real cartographic tiles (OpenStreetMap, MapLibre, Mapbox, or Leaflet tiles).
2. **Dynamic Map Padding Offset:** When a bottom sheet opens (height: 380px), the map camera MUST apply a bottom padding of equal height (`edgePadding: { bottom: sheetHeight }`) so pickup markers and routes stay centered in the visible top half.
3. **Traffic-Coded Polylines:** Real routes must support traffic congestion segments:
   - Emerald (`#059669` / `#00AA13`): Smooth flowing traffic
   - Amber (`#D97706`): Moderate congestion
   - Crimson (`#DC2626`): Heavy bumper-to-bumper traffic
4. **Callout Address Badges:** Pickup pins must display clear floating speech bubbles (`Grand Indonesia - Lobby Timur`) rather than bare circles.

---

## 3. Micro-Typography & Financial Layout Hardening

**The Visual Glitch:** Currency symbols (`Rp`) wrapping or stacking above numbers (`14.000`) due to unconstrained flex layouts or missing width protection.

**The Mandatory Rule:**
1. **Atomic Currency No-Wrap:** All monetary values MUST include `whitespace-nowrap`, `shrink-0`, and `tabular-nums`.
2. **Consistent Decimal & Thousand Separator:** Always pass numbers through `Intl.NumberFormat('id-ID')`.
3. **Structured Strikethrough Alignment:** Discounted original prices must be neatly stacked underneath or placed inline with matching baseline alignments.

```html
<!-- ✅ CORRECT: Flawless Production Financial Price Badge -->
<div class="flex flex-col items-end shrink-0">
  <div class="flex items-baseline gap-0.5 whitespace-nowrap">
    <span class="text-xs font-bold text-slate-800">Rp</span>
    <span class="text-base font-extrabold text-slate-900 tabular-nums">14.000</span>
  </div>
  <span class="text-xs text-slate-400 line-through tabular-nums whitespace-nowrap">
    Rp18.000
  </span>
</div>
```

---

## 4. Transactional Thumb-Zone Anatomy (The 3-Layer Checkout Stack)

Every transactional sheet (ride hailing, cart checkout, transfer money) must organize its lower 35% thumb zone into **3 distinct, predictable layers**:

```
┌────────────────────────────────────────────────────────────────────────┐
│                   THE 3-LAYER CHECKOUT STACK                           │
├────────────────────────────────────────────────────────────────────────┤
│ LAYER 1: Route / Cart Summary Strip                                    │
│   • Pickup & Drop-off badges with real-time ETA & distance             │
├────────────────────────────────────────────────────────────────────────┤
│ LAYER 2: Payment & Promo Selector Bar                                  │
│   [💳 GoPay • Rp84.500 ▾]            [🏷️ Promo 50% Dipakai ▾]          │
├────────────────────────────────────────────────────────────────────────┤
│ LAYER 3: Primary Sticky CTA Button (Min 48pt Touch Target)             │
│   [                 Pesan Sekarang (GoRide)                          ] │
└────────────────────────────────────────────────────────────────────────┘
```

### Component Blueprint:
```tsx
export const TransactionalCheckoutStack: React.FC<{
  paymentMethod: string;
  balance: number;
  promoCode?: string;
  serviceName: string;
  totalPrice: number;
  onOrder: () => void;
}> = ({ paymentMethod, balance, promoCode, serviceName, totalPrice, onOrder }) => {
  return (
    <div class="p-4 bg-white border-t border-slate-100 flex flex-col gap-3">
      {/* Layer 2: Payment & Promo Selectors */}
      <div class="flex items-center justify-between gap-2">
        <button class="flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-slate-100 text-slate-800 text-xs font-bold active:scale-95 transition-transform">
          <WalletIcon size={14} class="text-blue-600" />
          <span class="whitespace-nowrap">{paymentMethod}</span>
          <span class="tabular-nums text-slate-600">• Rp{balance.toLocaleString('id-ID')}</span>
          <ChevronDownIcon size={12} class="text-slate-400" />
        </button>

        <button class="flex items-center gap-1 px-3 py-1.5 rounded-full bg-emerald-50 text-emerald-700 text-xs font-bold active:scale-95 transition-transform">
          <TagIcon size={13} class="text-emerald-600" />
          <span class="whitespace-nowrap">{promoCode || 'Pakai Promo'}</span>
          <ChevronRightIcon size={12} />
        </button>
      </div>

      {/* Layer 3: Sticky CTA */}
      <button
        onClick={onOrder}
        class="w-full min-h-[48px] py-3.5 px-6 rounded-2xl bg-emerald-600 text-white font-extrabold text-sm flex items-center justify-center gap-2 shadow-lg shadow-emerald-600/25 active:scale-[0.98] transition-transform"
      >
        <span>Pesan Sekarang ({serviceName})</span>
      </button>
    </div>
  );
};
```

---

## 5. Rich Asset Discipline (Functional Icons vs Vivid Illustrations)

**The Flaw:** Using generic monochrome line-art icons (`<BikeIcon />` in a gray box) for primary fleet options, making cards look dead and uninspiring.

**The Rules:**
- **Functional Icons:** Monochrome line-art icons (Lucide / Phosphor) are reserved exclusively for utility navigation, actions (back, search, close, phone), and list item indicators.
- **Domain Vehicle & Product Assets:** Fleet choices (GoRide, GoCar, GoFood) and empty/success states MUST use colorful, vivid 2.5D or flat-shaded vector illustrations with brand-aligned color accents (e.g. green helmet motor, sleek white car with tinted glass, delivery package).

---

## 6. Hardware Back-Gesture & Dynamic Island Choreography

1. **Android Hardware Back / iOS Swipe Back Intercept:**
   - Level 3 (In-Trip / Active Order) $\rightarrow$ Level 2 (Cancel confirmation modal).
   - Level 2 (Select Vehicle) $\rightarrow$ Level 1 (Collapse sheet, return to Home & restore global tabs).
   - Never exit the app directly when a bottom sheet is open.
2. **Dynamic Island & Live Activity Pill:**
   - Display condensed live order state in the device island:
   ```html
   <div class="device-island expanded">
     <div class="flex items-center gap-2 text-white text-xs font-bold px-2">
       <span>🛵</span>
       <span class="text-emerald-400">Budi Santoso</span>
       <span class="tabular-nums text-slate-400 ml-auto">2 mnt</span>
     </div>
   </div>
   ```
