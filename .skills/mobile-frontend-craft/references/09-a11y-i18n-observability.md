# 09: Accessibility, i18n, Dynamic Type & Observability

This manual provides standards for inclusive design, dynamic OS font scaling resilience, multi-language internationalization, and granular error isolation.

---

## 1. Dynamic Type & OS Font Scaling Resilience

**The Sin:** Hardcoding fixed element heights (`height: 48px`) while wrapping text inside. When users with low vision increase their system text scale to 150% or 200%, the text overflows, clips, or overlaps with neighboring containers.

**The Fix:**
- Use flexible container heights (`minHeight: 48px` instead of fixed `height: 48px`).
- React Native: utilize `maxFontSizeMultiplier={1.4}` on non-critical compact badges and allow primary text containers to wrap gracefully.
- Web: Use `rem` units for typography and test with `font-size: 200%` root simulation.

```tsx
// ✅ GOOD: Resilient accessible button
<button class="min-h-[48px] py-2 px-4 rounded-xl bg-blue-600 text-white font-semibold text-sm flex items-center justify-center gap-2 text-center">
  <span class="break-words line-clamp-2">{label}</span>
</button>
```

---

## 2. APCA & WCAG AA Accessibility Checklist

1. **Touch Target Size:**
   - Minimum interactive area: $44\times44\text{pt}$ (iOS) / $48\times48\text{dp}$ (Android).
   - If the visual icon is 20px, pad the hit target (`hitSlop={{ top: 12, bottom: 12, left: 12, right: 12 }}` in React Native, or `p-3` in Web).
2. **Accessible Name on Icon-Only Buttons:**
   - Every button without visible text MUST have `aria-label` (Web) or `accessibilityLabel` + `accessibilityRole="button"` (Mobile).
   ```tsx
   <button aria-label="Tutup menu navigasi" class="w-11 h-11 flex items-center justify-center">
     <XIcon size={20} aria-hidden="true" />
   </button>
   ```
3. **Contrast Standards:**
   - Regular text: Minimum 4.5:1 contrast against surface.
   - Large text (18pt+ bold or 24pt+ normal): Minimum 3:1.
   - Never use pale gray text (`#CBD5E1`) over white backgrounds (`#FFFFFF`).

---

## 3. i18n, Multi-Currency & Timezone Conversion

Never hardcode formatted strings directly into UI elements.

```typescript
// src/lib/i18n/formatters.ts
export const formatCurrency = (amount: number, currency = 'IDR', locale = 'id-ID'): string => {
  return new Intl.NumberFormat(locale, {
    style: 'currency',
    currency,
    maximumFractionDigits: 0,
  }).format(amount);
};

export const formatDeviceLocalTime = (utcIsoString: string, locale = 'id-ID'): string => {
  const date = new Date(utcIsoString);
  return new Intl.DateTimeFormat(locale, {
    dateStyle: 'medium',
    timeStyle: 'short',
    timeZone: Intl.DateTimeFormat().resolvedOptions().timeZone, // Automatic device timezone
  }).format(date);
};
```

---

## 4. Granular Error Boundary (Widget Isolation)

**The Problem:** An unhandled JavaScript error inside a non-critical analytics chart or banner crashes the whole screen into a white blank page.
**The Fix:** Wrap independent sections in dedicated Error Boundaries with contextual recovery buttons.

```tsx
// src/components/common/WidgetErrorBoundary.tsx
import React, { Component, ErrorInfo, ReactNode } from 'react';

interface Props {
  fallbackTitle?: string;
  children: ReactNode;
}

interface State {
  hasError: boolean;
  error?: Error;
}

export class WidgetErrorBoundary extends Component<Props, State> {
  public state: State = { hasError: false };

  public static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error };
  }

  public componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error('Widget error captured:', error, errorInfo);
  }

  public render() {
    if (this.state.hasError) {
      return (
        <div class="p-4 rounded-2xl bg-rose-50 border border-rose-200 text-center my-2">
          <h4 class="text-xs font-bold text-rose-800 mb-1">{this.props.fallbackTitle || 'Gagal Memuat Komponen'}</h4>
          <p class="text-xs text-rose-600 mb-3">Terjadi kendala saat memproses widget ini.</p>
          <button
            onClick={() => this.setState({ hasError: false })}
            class="px-3 py-1.5 rounded-lg bg-rose-600 text-white text-xs font-bold active:scale-95 transition-transform"
          >
            Coba Lagi
          </button>
        </div>
      );
    }

    return this.props.children;
  }
}
```

---

## 5. Force Update & Maintenance Gate

In mobile production, breaking backend API changes require users on older versions to update before proceeding.

```typescript
export interface AppVersionStatus {
  isSupported: boolean;
  isMaintenance: boolean;
  minSupportedVersion: string;
  updateUrl: string;
}

export function checkVersionLock(currentVersion: string, status: AppVersionStatus): 'ok' | 'force_update' | 'maintenance' {
  if (status.isMaintenance) return 'maintenance';
  if (!status.isSupported) return 'force_update';
  return 'ok';
}
```
