# 02: Design Tokens & Multi-Language Framework Mapping

This document provides the universal token architecture and its exact implementation across **Tailwind/daisyUI/HeroUI**, **React Native**, **Flutter**, **SwiftUI**, and **Jetpack Compose**.

---

## 1. The 4pt / 8pt Spatial Grid (Universal)

| Token | Value | React Native / Flutter | Swift / Compose | Tailwind Class |
| :--- | :--- | :--- | :--- | :--- |
| `space.xs` | 4pt/dp | `4.0` | `4.dp` / `4.0` | `p-1`, `gap-1` |
| `space.sm` | 8pt/dp | `8.0` | `8.dp` / `8.0` | `p-2`, `gap-2` |
| `space.md` | 12pt/dp | `12.0` | `12.dp` / `12.0` | `p-3`, `gap-3` |
| `space.lg` | 16pt/dp | `16.0` (Screen Gutter) | `16.dp` / `16.0` | `p-4`, `gap-4` |
| `space.xl` | 20pt/dp | `20.0` (Card Padding) | `20.dp` / `20.0` | `p-5`, `gap-5` |
| `space.2xl` | 24pt/dp | `24.0` (Outer Radius) | `24.dp` / `24.0` | `p-6`, `gap-6` |
| `space.3xl` | 32pt/dp | `32.0` | `32.dp` / `32.0` | `p-8`, `gap-8` |

---

## 2. Multi-Language Token Mapping

### A. React Native & NativeWind / Expo
```typescript
export const ThemeTokens = {
  canvas: '#F8F9FA',
  surface: '#FFFFFF',
  surfaceSubtle: '#F1F5F9',
  textPrimary: '#0F172A',
  textSecondary: '#64748B',
  borderHairline: 'rgba(15, 23, 42, 0.08)',
  radiusOuter: 24,
  radiusInner: 12,
};
```

### B. Flutter (Dart)
```dart
class AppTokens {
  static const Color canvas = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color surfaceSubtle = Color(0xFFF1F5F9);
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color borderHairline = Color(0x140F172A);
  static const double radiusOuter = 24.0;
  static const double radiusInner = 12.0;
}
```

### C. SwiftUI (iOS Native Swift)
```swift
struct AppTheme {
    static let canvas = Color(hex: "F8F9FA")
    static let surface = Color.white
    static let surfaceSubtle = Color(hex: "F1F5F9")
    static let textPrimary = Color(hex: "0F172A")
    static let textSecondary = Color(hex: "64748B")
    static let borderHairline = Color(hex: "0F172A").opacity(0.08)
    static let radiusOuter: CGFloat = 24
    static let radiusInner: CGFloat = 12
}
```

### D. Jetpack Compose (Android Native Kotlin)
```kotlin
object AppTheme {
    val canvas = Color(0xFFF8F9FA)
    val surface = Color.White
    val surfaceSubtle = Color(0xFFF1F5F9)
    val textPrimary = Color(0xFF0F172A)
    val textSecondary = Color(0xFF64748B)
    val borderHairline = Color(0x140F172A)
    val radiusOuter = 24.dp
    val radiusInner = 12.dp
}
```

### E. Tailwind / daisyUI / HeroUI / Mantine (Web & Capacitor/PWA)
```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        canvas: '#F8F9FA',
        surface: '#FFFFFF',
        'surface-subtle': '#F1F5F9',
        'text-primary': '#0F172A',
        'text-secondary': '#64748B',
      },
      borderRadius: {
        'concentric-outer': '24px',
        'concentric-inner': '12px',
      }
    }
  }
}
```
