# 01: Anti-Slop Guardrails & Negative Constraints

This document defines the strict **DO NOT DO** rules. These are the patterns that trigger the "AI Slop" label and must be aggressively avoided.

---

## 1. The Visual Slop Hall of Shame

### ❌ Pattern 1: The Electric Purple-Blue Gradient Hero
- **The Sin:** Linear gradients from `#8A2BE2` to `#4169E1` slapped on buttons, card headers, or ambient background blobs.
- **The Fix:** Flat, high-contrast, confident surfaces. Use clean tonal backgrounds (`#FAFAFA` in light, `#0D0E11` in dark) with a single, disciplined accent color (e.g., Deep Cobalt, Emerald, or Warm Terracotta).

### ❌ Pattern 2: Boxes Inside Boxes (Container Inception)
- **The Sin:** A screen wrapped in a card, which contains a list of cards, each containing a status container, which contains an icon container with a border.
- **The Fix:** Rely on **Gestalt proximity**. Group related items with consistent spacing (`gap: 12px` or `16px`). For lists, use **One Parent Card** with subtle inset dividers (`height: 1px`, `opacity: 0.08`), NOT individual bordered cards for each row.

### ❌ Pattern 3: Colored Vertical Stripe on Card Edges
- **The Sin:** A 4px vertical colored stripe on the left edge of a card to make it look "cool" without functional meaning.
- **The Fix:** If an item has a status (e.g., Paid vs Pending), indicate it with a restrained pill badge (`paddingHorizontal: 8`, `paddingVertical: 4`, rounded full) or subtle icon tint. Never decorate structural cards with arbitrary stripes.

### ❌ Pattern 4: Decorative Sparkle (`✨`) Spam
- **The Sin:** Sprinkling `✨` or "AI-Powered" badges across every header, button, or search box.
- **The Fix:** Invisible intelligence. If a feature is intelligent, let its output delight the user. No decorative starbursts.

### ❌ Pattern 5: Mismatched Corner Radii
- **The Sin:** Parent card has `borderRadius: 12`, child inner image has `borderRadius: 24`, and an inner button has `borderRadius: 4`.
- **The Fix:** **Concentric Radius Rule:**
  $$\text{Outer Radius} = \text{Inner Radius} + \text{Padding}$$
  *Example:* If a card has `padding: 12px` and an inner image with `borderRadius: 12px`, the card's outer radius MUST be `24px` ($12 + 12$).

---

## 2. The Ergonomic & Functional Slop

### ❌ Pattern 6: Top-Corner Trapped CTAs
- **The Sin:** Placing "Save", "Submit", or "Next" at the top-right navbar corner where a one-handed thumb cannot reach it without hand gymnastics.
- **The Fix:** Anchor primary CTAs in the lower 35% of the viewport (sticky bottom bar, floating pill, or bottom sheet CTA).

### ❌ Pattern 7: Missing Hit-Slop on Icons
- **The Sin:** A back arrow icon measuring `20x20` with zero padding, forcing users to tap 3 times before hitting the target.
- **The Fix:** Always use `hitSlop={{ top: 12, bottom: 12, left: 12, right: 12 }}` or wrap the icon inside a container with `minWidth: 44, minHeight: 44, justifyContent: 'center', alignItems: 'center'`.

### ❌ Pattern 8: Monolithic `ScrollView` with `.map()`
- **The Sin:** Rendering 50 dynamic items using array `.map()` inside a standard `ScrollView`.
- **The Fix:** Use `@shopify/flash-list` or `FlatList` with `estimatedItemSize` in React Native, or `ListView.builder` in Flutter.

### ❌ Pattern 9: Unhandled Dynamic Island & Notch
- **The Sin:** Top navbar elements colliding with the status bar clock or camera notch.
- **The Fix:** Always wrap screens or read insets from `useSafeAreaInsets()` (React Native) or `SafeArea` (Flutter). Never hardcode `paddingTop: 40`.
