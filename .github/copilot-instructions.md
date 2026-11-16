# MobileCraft: GitHub Copilot Instructions for Mobile Development

When generating or editing mobile frontend code (React Native, Expo, Flutter):

1. STRICT ZERO-SLOP VISUALS:
   - NEVER use neon purple-blue gradients (`#8A2BE2` -> `#4169E1`). Use disciplined tonal surface hierarchies (`#F8F9FA` canvas with `#FFFFFF` cards in light mode; `#0B0C0E` canvas with `#14161B` in dark mode).
   - NEVER use boxes inside boxes (nested cards). Group related list items into ONE single card with inset hairline dividers (`Divider(indent: 68)` in Flutter or `borderBottomWidth: 1` with left margin in React Native).
   - NEVER use arbitrary decorative vertical colored stripes on card edges.
   - NEVER use sparkle icons (✨) or generic "AI-powered" tags.

2. CONCENTRIC CORNER RADIUS:
   - Always follow: `Outer Radius = Inner Radius + Padding`. If card padding is 16 and outer radius is 24, inner elements must have radius 8.

3. THUMB-ZONE ERGONOMICS:
   - Anchor primary CTAs and interactive bars in the bottom 35% of the viewport.
   - Interactive touch targets must be at least 44x44pt (iOS) or 48x48dp (Android). Provide `hitSlop` if visual icons are smaller.
   - Always derive safe area insets dynamically (`useSafeAreaInsets` in React Native or `SafeArea` in Flutter). Never hardcode status bar heights.

4. TACTILITY & MOTION:
   - Interactive buttons must provide spring-based scaling (`scale: 0.97` on press-down) paired with light haptic feedback.
   - All currencies, numerical stats, timestamps, and counters must use `tabular-nums` / `FontFeature.tabularFigures()`.
   - Dynamic lists must use `FlashList` (React Native) or `ListView.builder` (Flutter).

5. THE 4 MANDATORY STATES:
   - Every screen/list must implement: Loading (Skeleton Shimmer), Empty (Actionable), Error (Retry), and Overflow (`ellipsizeMode="tail"` / `TextOverflow.ellipsis`).
