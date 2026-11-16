# 04: Motion, Tactile Feedback & Platform Idioms

Motion in mobile UI exists to clarify spatial transitions and acknowledge touch — never to distract.

---

## 1. Motion Restraint & Spring Physics

- **Subtle Press Feedback:** Interactive buttons and rows should respond immediately on press with a subtle scale (`0.97` or `0.98`) or opacity/ripple change, using snappy spring curves rather than slow linear transitions.
- **No Competing Loops:** Never run multiple looping pulse, bounce, or ping animations on the same screen. Keep screens calm and focused.
- **Respect Reduced Motion:** Honor `prefers-reduced-motion: reduce` on web and system reduced-motion settings on native platforms.

---

## 2. Native Tactile Haptics

Pair key interactions with light haptic feedback on native platforms:

| Interaction | React Native (`expo-haptics`) | Flutter | SwiftUI | Jetpack Compose |
| :--- | :--- | :--- | :--- | :--- |
| **Button Tap** | `impactAsync(Light)` | `HapticFeedback.lightImpact()` | `.sensoryFeedback(.impact(weight: .light))` | `HapticFeedbackType.TextHandleMove` |
| **Tab / Filter Switch** | `selectionAsync()` | `HapticFeedback.selectionClick()` | `.sensoryFeedback(.selection)` | `HapticFeedbackType.TextHandleMove` |
| **Success / Payment** | `notificationAsync(Success)` | `HapticFeedback.mediumImpact()` | `.sensoryFeedback(.success)` | `HapticFeedbackType.LongPress` |

---

## 3. Platform Idioms (iOS vs Android)

- **iOS (Apple HIG):**
  - Clean light/dark grouped surfaces (`#F2F2F7` / `#000000`), translucent blurred bars, swipe-back navigation, SF Symbols, sheet detents.
- **Android (Material Design 3):**
  - Tonal surface elevation, pill-shaped active tab indicators, `android_ripple` touch feedback, Material Symbols, `WindowInsets.safeDrawing`.
- **Virtualization for Long Lists:**
  - Always use virtualized lists for large datasets: `@shopify/flash-list` (React Native), `ListView.builder` / `SliverList` (Flutter), `LazyVStack` (SwiftUI), `LazyColumn` (Compose).
