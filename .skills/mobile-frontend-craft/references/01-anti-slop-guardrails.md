# 01: Anti-Slop Guardrails & Library-Specific Pitfalls

This document defines forbidden visual patterns and library-specific slop traps across React Native, Flutter, SwiftUI, Jetpack Compose, and Mobile Web (Capacitor/Ionic/PWA).

---

## 1. Universal Visual Slop Pitfalls (All Languages)

### ❌ Pattern 1: The Electric Purple-Blue Gradient Hero
- **The Sin:** Linear gradients from `#8A2BE2` to `#4169E1` on buttons, card headers, or ambient background blobs.
- **The Fix:** Flat, high-contrast, confident surfaces. Use clean tonal backgrounds (`#FAFAFA` in light, `#0D0E11` in dark) with a single disciplined accent (Cobalt, Emerald, or Warm Terracotta).

### ❌ Pattern 2: Boxes Inside Boxes (Container Inception)
- **The Sin:** A screen wrapped in a card, containing a list of cards, each containing an icon container with a border.
- **The Fix:** Use **Gestalt proximity**. Group related items with consistent spacing (`gap: 12px` or `16px`). For lists, use **One Parent Card** with subtle inset dividers (`height: 1px`, `opacity: 0.08`), NOT individual bordered cards for each row.

### ❌ Pattern 3: Colored Vertical Stripe on Card Edges
- **The Sin:** A 4px vertical colored stripe on the left edge of a card to make it look "cool" without functional meaning.
- **The Fix:** Indicate status with a restrained pill badge (`paddingHorizontal: 8`, `paddingVertical: 4`, rounded full) or subtle icon tint. Never decorate structural cards with arbitrary stripes.

### ❌ Pattern 4: Decorative Sparkle (`✨`) Spam
- **The Sin:** Sprinkling `✨` or "AI-Powered" badges across headers, buttons, or search boxes.
- **The Fix:** Invisible intelligence. Let the output delight the user without decorative starbursts.

### ❌ Pattern 5: Mismatched Corner Radii
- **The Sin:** Parent card has `borderRadius: 12`, child inner image has `borderRadius: 24`, and an inner button has `borderRadius: 4`.
- **The Fix:** **Concentric Radius Rule:**
  $$\text{Outer Radius} = \text{Inner Radius} + \text{Padding}$$

---

## 2. Library-Specific Slop Traps & How to Fix Them

### 🎨 daisyUI Slop Trap
* **The Slop:** Using uncustomized default saturated color classes (`btn-primary`, `badge-secondary`) which default to bright cyan/pink candy palettes.
* **The Fix:** Map daisyUI's `tailwind.config.js` themes to MobileCraft semantic tokens:
  ```javascript
  daisyui: {
    themes: [{
      mobilecraft: {
        "primary": "#0F172A",
        "secondary": "#64748B",
        "accent": "#0284C7",
        "neutral": "#F8F9FA",
        "base-100": "#FFFFFF",
        "base-200": "#F1F5F9",
      }
    }]
  }
  ```

### ⚡ HeroUI (NextUI) Slop Trap
* **The Slop:** Overusing heavy backdrop-blur cards (`backdrop-blur-md` on stacked elements) causing visual mud and poor text contrast.
* **The Fix:** Use solid surface cards with subtle hairline borders (`border-default-100`). Leverage HeroUI's built-in spring motion and accessible tabs rather than stacking glass layers.

### 🧩 Radix UI / Headless UI Slop Trap
* **The Slop:** Forgetting touch targets or keyboard avoidance because headless components have zero default CSS.
* **The Fix:** Always wrap Radix/Headless triggers with minimum `min-h-[44px] min-w-[44px]` and anchor Sheet / Dialog components to the bottom (`items-end` with `slide-in-from-bottom`) for mobile ergonomics.

### 🛡️ Mantine Slop Trap
* **The Slop:** Using desktop-density tables (`Table`) or centered modal popups (`Modal`) on phone viewports.
* **The Fix:** In Mantine, always use `Drawer` with `position="bottom"` for modals on mobile, and replace `Table` with card-based grouped lists.

### 🏛️ Material UI (MUI) Slop Trap
* **The Slop:** The generic "Google 2014" look: sharp rectangle elevated cards with default dark drop shadows and `#1976d2` buttons.
* **The Fix:** Override theme shape (`shape: { borderRadius: 16 }`), disable ripple for native spring scale, and replace harsh drop shadows with subtle 1px border outlines (`border: '1px solid rgba(15, 23, 42, 0.08)'`).

### 🏢 Ant Design Slop Trap
* **The Slop:** Dense desktop data-grids and tiny `size="small"` action buttons impossible to hit with a human thumb.
* **The Fix:** Use `size="large"` for buttons ($44\text{px}+$), replace `Table` with custom MobileCraft card list widgets, and use `Drawer` for bottom filter sheets.
