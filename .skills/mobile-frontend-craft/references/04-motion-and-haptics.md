# 04: Motion, Spring Physics & Haptic Choreography (Multi-Language)

This document provides native spring physics and haptics implementations across all major mobile platforms.

---

## 1. Spring Physics Presets Lintas Bahasa

### React Native (`react-native-reanimated`)
```typescript
export const SpringConfig = {
  snappy: { damping: 15, stiffness: 300, mass: 0.8 },
  gentle: { damping: 20, stiffness: 140, mass: 1.2 },
};
// Usage: withSpring(0.97, SpringConfig.snappy)
```

### Flutter (Dart)
```dart
AnimatedScale(
  scale: isPressed ? 0.97 : 1.0,
  duration: const Duration(milliseconds: 120),
  curve: Curves.easeOutBack,
  child: widget,
)
```

### SwiftUI (iOS Swift)
```swift
Button(action: performAction) {
    Text("Tambah ke Tas")
}
.buttonStyle(ScaleButtonStyle())

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
    }
}
```

### Jetpack Compose (Android Kotlin)
```kotlin
val scale by animateFloatAsState(
    targetValue = if (isPressed) 0.97f else 1f,
    animationSpec = spring(dampingRatio = Spring.DampingRatioMediumBouncy, stiffness = Spring.StiffnessMedium)
)
Box(modifier = Modifier.graphicsLayer { scaleX = scale; scaleY = scale })
```

---

## 2. Haptic Feedback Calls Lintas Bahasa

| Event | React Native (`expo-haptics`) | Flutter (`services`) | SwiftUI (`sensoryFeedback`) | Android Compose (`HapticFeedback`) |
| :--- | :--- | :--- | :--- | :--- |
| **Tap Button** | `impactAsync(Light)` | `HapticFeedback.lightImpact()` | `.sensoryFeedback(.impact(weight: .light))` | `performHapticFeedback(TextHandleMove)` |
| **Tab Switch** | `selectionAsync()` | `HapticFeedback.selectionClick()` | `.sensoryFeedback(.selection)` | `performHapticFeedback(GestureThresholdActivate)` |
| **Success/Pay**| `notificationAsync(Success)`| `HapticFeedback.mediumImpact()` | `.sensoryFeedback(.success)` | `performHapticFeedback(Confirm)` |
| **Error** | `notificationAsync(Error)` | `HapticFeedback.heavyImpact()` | `.sensoryFeedback(.error)` | `performHapticFeedback(Reject)` |
