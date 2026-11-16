# 03: Component Blueprints (Production-Ready)

Use these exact architectural patterns when implementing mobile components. They are designed for React Native with `react-native-reanimated` and `expo-haptics`.

---

## 1. TactileButton (Spring Scale + Haptic Feedback)

```tsx
import React from 'react';
import { StyleSheet, Text, ActivityIndicator, Pressable, ViewStyle, TextStyle } from 'react-native';
import Animated, { useSharedValue, useAnimatedStyle, withSpring } from 'react-native-reanimated';
import * as Haptics from 'expo-haptics';

interface TactileButtonProps {
  onPress: () => void;
  label: string;
  variant?: 'primary' | 'secondary' | 'subtle';
  isLoading?: boolean;
  disabled?: boolean;
  style?: ViewStyle;
}

const SPRING_CONFIG = { damping: 15, stiffness: 300, mass: 0.8 };

export const TactileButton: React.FC<TactileButtonProps> = ({
  onPress,
  label,
  variant = 'primary',
  isLoading = false,
  disabled = false,
  style,
}) => {
  const scale = useSharedValue(1);

  const animatedStyle = useAnimatedStyle(() => ({
    transform: [{ scale: scale.value }],
  }));

  const handlePressIn = () => {
    if (disabled || isLoading) return;
    scale.value = withSpring(0.97, SPRING_CONFIG);
  };

  const handlePressOut = () => {
    scale.value = withSpring(1, SPRING_CONFIG);
  };

  const handlePress = () => {
    if (disabled || isLoading) return;
    Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
    onPress();
  };

  return (
    <Animated.View style={[styles.wrapper, animatedStyle, style]}>
      <Pressable
        onPressIn={handlePressIn}
        onPressOut={handlePressOut}
        onPress={handlePress}
        disabled={disabled || isLoading}
        style={[styles.button, styles[variant], disabled && styles.disabled]}
        hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
      >
        {isLoading ? (
          <ActivityIndicator color={variant === 'primary' ? '#FFFFFF' : '#0F172A'} />
        ) : (
          <Text style={[styles.text, textStyles[variant]]}>{label}</Text>
        )}
      </Pressable>
    </Animated.View>
  );
};

const styles = StyleSheet.create({
  wrapper: { width: '100%' },
  button: {
    height: 52,
    borderRadius: 16,
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'row',
  },
  primary: { backgroundColor: '#0F172A' },
  secondary: { backgroundColor: '#F1F5F9' },
  subtle: { backgroundColor: 'transparent', borderWidth: 1, borderColor: 'rgba(15, 23, 42, 0.12)' },
  disabled: { opacity: 0.5 },
  text: { fontSize: 16, fontWeight: '600' },
});

const textStyles = StyleSheet.create({
  primary: { color: '#FFFFFF' },
  secondary: { color: '#0F172A' },
  subtle: { color: '#0F172A' },
});
```

---

## 2. BentoCard (Concentric Corner Radius Rule)

```tsx
import React, { ReactNode } from 'react';
import { View, StyleSheet, ViewStyle } from 'react-native';

interface BentoCardProps {
  children: ReactNode;
  padding?: number;
  outerRadius?: number;
  style?: ViewStyle;
}

export const BentoCard: React.FC<BentoCardProps> = ({
  children,
  padding = 16,
  outerRadius = 24,
  style,
}) => {
  return (
    <View style={[styles.card, { padding, borderRadius: outerRadius }, style]}>
      {children}
    </View>
  );
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#FFFFFF',
    borderWidth: 1,
    borderColor: 'rgba(15, 23, 42, 0.06)',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.03,
    shadowRadius: 10,
    elevation: 2,
  },
});
```

---

## 3. GroupedList & GroupedRow (Anti-Card-Spam List Pattern)

Never wrap individual list items in separate floating bordered cards. Use one unified container with inset dividers:

```tsx
import React from 'react';
import { View, Text, Pressable, StyleSheet } from 'react-native';
import * as Haptics from 'expo-haptics';

interface GroupedRowProps {
  icon: React.ReactNode;
  title: string;
  subtitle?: string;
  value?: string;
  isLast?: boolean;
  onPress?: () => void;
}

export const GroupedRow: React.FC<GroupedRowProps> = ({
  icon,
  title,
  subtitle,
  value,
  isLast = false,
  onPress,
}) => {
  return (
    <Pressable
      onPress={() => {
        if (onPress) {
          Haptics.selectionAsync();
          onPress();
        }
      }}
      style={({ pressed }) => [styles.row, pressed && styles.rowPressed]}
    >
      <View style={styles.iconContainer}>{icon}</View>
      <View style={[styles.contentContainer, !isLast && styles.hairlineDivider]}>
        <View style={styles.textGroup}>
          <Text style={styles.title} numberOfLines={1}>{title}</Text>
          {subtitle && <Text style={styles.subtitle} numberOfLines={1}>{subtitle}</Text>}
        </View>
        {value && <Text style={styles.value}>{value}</Text>}
      </View>
    </Pressable>
  );
};

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    height: 64,
  },
  rowPressed: { backgroundColor: 'rgba(0, 0, 0, 0.03)' },
  iconContainer: { width: 40, height: 40, justifyContent: 'center', alignItems: 'center' },
  contentContainer: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    height: '100%',
    marginLeft: 12,
  },
  hairlineDivider: {
    borderBottomWidth: 1,
    borderBottomColor: 'rgba(15, 23, 42, 0.06)',
  },
  textGroup: { flex: 1, paddingRight: 8 },
  title: { fontSize: 15, fontWeight: '600', color: '#0F172A' },
  subtitle: { fontSize: 13, color: '#64748B', marginTop: 2 },
  value: { fontSize: 15, fontWeight: '500', color: '#0F172A', fontVariant: ['tabular-nums'] },
});
```

---

## 4. ModernInput (Recessed Surface, Focus Ring, Clear Action)

```tsx
import React, { useState } from 'react';
import { View, TextInput, Text, StyleSheet, Pressable } from 'react-native';

interface ModernInputProps {
  label: string;
  value: string;
  onChangeText: (text: string) => void;
  placeholder?: string;
  error?: string;
  secureTextEntry?: boolean;
}

export const ModernInput: React.FC<ModernInputProps> = ({
  label,
  value,
  onChangeText,
  placeholder,
  error,
  secureTextEntry = false,
}) => {
  const [isFocused, setIsFocused] = useState(false);

  return (
    <View style={styles.wrapper}>
      <Text style={styles.label}>{label}</Text>
      <View style={[
        styles.inputContainer,
        isFocused && styles.inputFocused,
        !!error && styles.inputError,
      ]}>
        <TextInput
          style={styles.input}
          value={value}
          onChangeText={onChangeText}
          placeholder={placeholder}
          placeholderTextColor="#94A3B8"
          onFocus={() => setIsFocused(true)}
          onBlur={() => setIsFocused(false)}
          secureTextEntry={secureTextEntry}
        />
        {value.length > 0 && (
          <Pressable onPress={() => onChangeText('')} hitSlop={10} style={styles.clearButton}>
            <Text style={styles.clearText}>✕</Text>
          </Pressable>
        )}
      </View>
      {error ? <Text style={styles.errorText}>{error}</Text> : null}
    </View>
  );
};

const styles = StyleSheet.create({
  wrapper: { width: '100%', marginBottom: 16 },
  label: { fontSize: 13, fontWeight: '600', color: '#475569', marginBottom: 6 },
  inputContainer: {
    height: 52,
    backgroundColor: '#F8FAFC',
    borderRadius: 14,
    borderWidth: 1.5,
    borderColor: 'transparent',
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 14,
  },
  inputFocused: {
    borderColor: '#0F172A',
    backgroundColor: '#FFFFFF',
  },
  inputError: {
    borderColor: '#EF4444',
  },
  input: { flex: 1, fontSize: 15, color: '#0F172A' },
  clearButton: { padding: 4 },
  clearText: { color: '#94A3B8', fontSize: 12, fontWeight: '700' },
  errorText: { fontSize: 12, color: '#EF4444', marginTop: 4 },
});
```

---

## 5. Skeleton Shimmer (Loading State Guard)

```tsx
import React, { useEffect } from 'react';
import { ViewStyle, StyleSheet } from 'react-native';
import Animated, {
  useSharedValue,
  useAnimatedStyle,
  withRepeat,
  withTiming,
  Easing,
} from 'react-native-reanimated';

export const Skeleton: React.FC<{ width: number | `${number}%`; height: number; radius?: number; style?: ViewStyle }> = ({
  width,
  height,
  radius = 8,
  style,
}) => {
  const opacity = useSharedValue(0.4);

  useEffect(() => {
    opacity.value = withRepeat(
      withTiming(0.85, { duration: 800, easing: Easing.inOut(Easing.ease) }),
      -1,
      true
    );
  }, []);

  const animatedStyle = useAnimatedStyle(() => ({ opacity: opacity.value }));

  return (
    <Animated.View
      style={[
        styles.skeleton,
        { width, height, borderRadius: radius },
        animatedStyle,
        style,
      ]}
    />
  );
};

const styles = StyleSheet.create({
  skeleton: { backgroundColor: '#E2E8F0' },
});
```
