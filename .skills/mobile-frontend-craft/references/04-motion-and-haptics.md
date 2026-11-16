# 04: Motion, Physics & Haptic Feedback

Mobile apps feel alive because of **spring physics** and **tactile feedback**, not static timing curves. This document sets the standards for motion in React Native (`react-native-reanimated`) and Flutter.

---

## 1. Spring Physics vs Linear Timings

Never use linear animations (`duration: 300ms`) for interactive UI transitions. Springs simulate real physical mass and momentum.

### The 3 Standard Spring Presets

```typescript
export const SpringPresets = {
  // Snappy: For buttons, switches, micro-interactions, scale-down
  snappy: {
    damping: 15,
    stiffness: 300,
    mass: 0.8,
  },
  // Bouncy / Playful: For badges, modal entrance, toast drop-down
  bouncy: {
    damping: 12,
    stiffness: 180,
    mass: 1,
  },
  // Gentle / Sheet: For bottom sheets, page transition, large layout shifts
  gentle: {
    damping: 20,
    stiffness: 140,
    mass: 1.2,
  },
};
```

---

## 2. Haptic Feedback Choreography (`expo-haptics`)

Haptics must be used intentionally. Overusing haptics creates fatigue; omitting them makes the interface feel like plastic.

| Event | Haptic Call | Purpose |
| :--- | :--- | :--- |
| **Primary Button Tap** | `Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light)` | Confirms tap registration |
| **Tab Bar Selection** | `Haptics.selectionAsync()` | Subtle tactile notch feel |
| **Toggle Switch Flick** | `Haptics.selectionAsync()` | Physical toggle sensation |
| **Pull-to-Refresh Triggered** | `Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium)` | Signifies threshold crossed |
| **Payment / Destructive Confirmation** | `Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success)` | High-trust emotional feedback |
| **Form Validation Error** | `Haptics.notificationAsync(Haptics.NotificationFeedbackType.Error)` | Physical alert of blocking error |

---

## 3. Micro-Interaction Rules

1. **Touch-Down Latency (< 50ms):**
   - The UI must react visually the exact millisecond the user's finger touches the screen (`onPressIn`). Never wait for `onPress` (release) before showing feedback.
2. **Press Scale Target:**
   - Standard buttons: `scale: 0.97`
   - Compact chips/icons: `scale: 0.94`
   - Cards/Bento tiles: `scale: 0.985`
3. **Skeleton Pulse Synchronization:**
   - When multiple skeleton placeholders are on screen, share a single animated opacity clock or pulse so the shimmer pulses synchronously across all items.
