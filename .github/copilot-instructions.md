# MobileCraft: Universal Multi-Language Instructions for GitHub Copilot

When generating or editing mobile frontend code in TypeScript/JavaScript (React Native, Expo, Capacitor, Ionic, PWA), Dart (Flutter), Swift (SwiftUI), or Kotlin (Jetpack Compose):

Supported Libraries: daisyUI, HeroUI (NextUI), Radix UI / Headless UI, Mantine, Material UI (MUI), Ant Design.

1. ZERO AI SLOP (NON-NEGOTIABLE):
   - NEVER use neon purple-blue gradients (`#8A2BE2` -> `#4169E1`). Use disciplined tonal surface hierarchies (`#F8F9FA` canvas with `#FFFFFF` cards in light mode; `#0B0C0E` canvas with `#14161B` in dark mode).
   - NEVER use boxes inside boxes (nested cards). Group related list items into ONE single card with inset hairline dividers.
   - NEVER use arbitrary decorative vertical colored stripes on card edges.
   - NEVER use sparkle icons (✨) or generic "AI-powered" tags.
   - When using daisyUI, HeroUI, Mantine, MUI, or Ant Design, customize their themes to follow MobileCraft depth tokens rather than leaving default framework boilerplate.

2. CONCENTRIC CORNER RADIUS:
   - Always follow: `Outer Radius = Inner Radius + Padding`. If card padding is 16 and outer radius is 24, inner elements must have radius 8.

3. THUMB-ZONE ERGONOMICS:
   - Anchor primary CTAs and interactive bars in the bottom 35% of the viewport.
   - Interactive touch targets must be at least 44x44pt (iOS) or 48x48dp (Android). Provide `hitSlop` if visual icons are smaller.
   - Derive safe area insets dynamically (`useSafeAreaInsets` in RN, `SafeArea` in Flutter, `safeAreaInsets` in Swift, `WindowInsets` in Compose).

4. TACTILITY & MOTION:
   - Interactive buttons must provide spring-based scaling (`scale: 0.97` on press-down) paired with light haptic feedback.
   - All currencies, numerical stats, timestamps, and counters must use tabular numbers (`tabular-nums`, `FontFeature.tabularFigures()`, or `.monospacedDigit()`).
   - Dynamic lists must be virtualized (`FlashList`, `ListView.builder`, `LazyVStack`, `LazyColumn`).

5. THE 4 MANDATORY STATES:
   - Every screen/list must implement: Loading (Skeleton Shimmer), Empty (Actionable), Error (Retry), and Overflow (text truncation).
