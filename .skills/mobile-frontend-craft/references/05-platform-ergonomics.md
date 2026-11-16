# 05: Platform Ergonomics & Screen Geometry

A mobile layout must account for real hardware constraints: human thumb reach, hardware notches, dynamic islands, software home indicators, and virtual keyboards.

---

## 1. The Thumb-Zone Reach Matrix

Most users operate phones single-handedly with their thumb.

```
+------------------------------------+
|         HARD-TO-REACH ZONE         |  <- Secondary info, title, settings icon
|        (Top 30% of screen)         |     NEVER put primary actions here!
+------------------------------------+
|            NATURAL ZONE            |  <- Content cards, bento charts,
|        (Middle 35% of screen)      |     scrollable lists
+------------------------------------+
|          THUMB-POWER ZONE          |  <- Primary CTAs, bottom tab navigation,
|        (Bottom 35% of screen)      |     filter triggers, sheet drag handles
+------------------------------------+
```

---

## 2. Safe Area Insets (React Native)

NEVER hardcode numeric padding for status bars (e.g., `paddingTop: 44` or `paddingBottom: 34`). Different devices (iPhone SE vs iPhone 16 Pro Max vs Android punch-hole) have drastically different insets.

### Pattern: Robust Screen Wrapper

```tsx
import React, { ReactNode } from 'react';
import { View, StyleSheet, StatusBar } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

export const ScreenContainer: React.FC<{
  children: ReactNode;
  bg?: string;
  statusBarStyle?: 'dark-content' | 'light-content';
}> = ({ children, bg = '#F8F9FA', statusBarStyle = 'dark-content' }) => {
  const insets = useSafeAreaInsets();

  return (
    <View style={[styles.container, { backgroundColor: bg, paddingTop: insets.top }]}>
      <StatusBar barStyle={statusBarStyle} backgroundColor="transparent" translucent />
      <View style={[styles.content, { paddingBottom: insets.bottom }]}>
        {children}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1 },
  content: { flex: 1 },
});
```

---

## 3. Keyboard Avoidance

When inputs are positioned in the bottom half of the screen, they will be obscured by the software keyboard unless wrapped properly:

```tsx
import { KeyboardAvoidingView, Platform, ScrollView } from 'react-native';

export const KeyboardScreenWrapper: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
      style={{ flex: 1 }}
      keyboardVerticalOffset={Platform.OS === 'ios' ? 12 : 0}
    >
      <ScrollView
        contentContainerStyle={{ flexGrow: 1 }}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        {children}
      </ScrollView>
    </KeyboardAvoidingView>
  );
};
```

---

## 4. Apple HIG vs Android Material 3 Adaptation

| Feature | iOS HIG Standard | Android Material 3 Standard |
| :--- | :--- | :--- |
| **Header** | Large Collapsible Title (`34pt bold`) shrinking on scroll | Left-aligned title with `TopAppBar` elevation |
| **Tab Bar** | Translucent blur background (`BlurView`), SF Symbols | Solid container, pill indicator around active icon |
| **Touch Feedback** | Opacity change / scale shrink | Ripple effect (`android_ripple={{ color: 'rgba(0,0,0,0.08)' }}`) |
| **Dialogs / Sheets** | Interactive swipe-down Sheet or Alert popup | Modal Bottom Sheet or M3 Rounded Dialog (radius 28dp) |
