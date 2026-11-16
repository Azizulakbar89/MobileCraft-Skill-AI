# 02: Design Tokens & Curated Theme Presets

This document specifies the token architecture and 4 curated visual themes. When generating code, select the theme matching the user's app domain, or use the project's existing token system.

---

## 1. The 4pt / 8pt Spatial Grid

All margins, paddings, gaps, and component dimensions MUST be derived from this scale:

| Token | Value (dp/pt) | Common Usage |
| :--- | :--- | :--- |
| `space.2xs` | 2 | Hairline gaps, micro-adjustments |
| `space.xs` | 4 | Inset badge padding, icon-text gap |
| `space.sm` | 8 | Compact card padding, chip spacing |
| `space.md` | 12 | Standard internal component gap |
| `space.lg` | 16 | Standard screen horizontal gutter, card padding |
| `space.xl` | 20 | Generous card padding, section gap |
| `space.2xl` | 24 | Gap between distinct visual groups |
| `space.3xl` | 32 | Major section break, empty state spacing |
| `space.4xl` | 48 | Hero spacer, modal sheet top margin |

---

## 2. Semantic Surface Architecture

Never assign arbitrary colors to containers. Always follow the 4-tier surface depth:

1. **`bg.canvas`:** The lowest level. Background of the screen.
2. **`bg.surface`:** Elevated once above canvas. Cards, grouped rows, hero modules.
3. **`bg.elevated`:** Floating above surface. Bottom sheets, action sheets, dropdowns, floating tabs.
4. **`bg.subtle`:** Recessed or subtle element inside a surface. Input backgrounds, inactive chips, skeleton shimmer base.

---

## 3. Curated Theme Presets (Plug & Play)

### Preset A: "Crisp Daylight" (Fintech, Banking, High-Trust SaaS)
- **Vibe:** Clean, ultra-sharp, confident, airy.
- `bg.canvas`: `#F8F9FA`
- `bg.surface`: `#FFFFFF`
- `bg.elevated`: `#FFFFFF` (with soft ambient shadow: `shadowColor: '#000', shadowOpacity: 0.04, shadowRadius: 12`)
- `bg.subtle`: `#F1F3F5`
- `text.primary`: `#0F172A` (Deep Slate Ink)
- `text.secondary`: `#64748B` (Muted Slate)
- `border.hairline`: `rgba(15, 23, 42, 0.07)`
- `accent.primary`: `#0284C7` (Cobalt) or `#059669` (Emerald)
- `accent.contrast`: `#FFFFFF`

### Preset B: "Obsidian Tactile" (Crypto, Dev Tools, Dark Luxury)
- **Vibe:** Rich charcoal, subtle top-lit specularity, high-end hardware feel.
- `bg.canvas`: `#0B0C0E`
- `bg.surface`: `#14161B`
- `bg.elevated`: `#1C1F26`
- `bg.subtle`: `#181B22`
- `text.primary`: `#F8FAFC` (Off-white)
- `text.secondary`: `#94A3B8` (Soft Grey)
- `border.hairline`: `rgba(255, 255, 255, 0.08)`
- `border.specular`: `rgba(255, 255, 255, 0.14)` (Top border highlight)
- `accent.primary`: `#6366F1` (Indigo Glow) or `#10B981` (Mint)

### Preset C: "Warm Editorial" (Lifestyle, Journaling, Reading, Food & Wine)
- **Vibe:** Tactile, natural, warm linen/cream, calming.
- `bg.canvas`: `#FBF9F5` (Warm Cream)
- `bg.surface`: `#FFFFFF`
- `bg.elevated`: `#FFFFFF`
- `bg.subtle`: `#F2EFE9`
- `text.primary`: `#1C1917` (Stone Espresso)
- `text.secondary`: `#78716C` (Warm Stone)
- `border.hairline`: `rgba(28, 25, 23, 0.08)`
- `accent.primary`: `#C2410C` (Terracotta) or `#4D7C0F` (Olive/Sage)

### Preset D: "Soft Bento Pastel" (Habit, Wellness, Personal Growth)
- **Vibe:** Friendly, organized, soft-toned, modular.
- `bg.canvas`: `#F6F7FB`
- `bg.surface`: `#FFFFFF`
- `bg.subtle`: `#EEF0F8`
- `accent.lavender`: `#EDE9FE`
- `accent.peach`: `#FFEDD5`
- `accent.mint`: `#D1FAE5`
- `text.primary`: `#1E293B`
- `text.secondary`: `#64748B`

---

## 4. Typography Scale & Tabular Numbers

```typescript
export const Typography = {
  display: { fontSize: 32, lineHeight: 38, fontWeight: '700', letterSpacing: -0.6 },
  headline: { fontSize: 24, lineHeight: 30, fontWeight: '700', letterSpacing: -0.4 },
  title: { fontSize: 18, lineHeight: 24, fontWeight: '600', letterSpacing: -0.2 },
  bodyLarge: { fontSize: 16, lineHeight: 22, fontWeight: '400' },
  bodyMedium: { fontSize: 14, lineHeight: 20, fontWeight: '400' },
  caption: { fontSize: 12, lineHeight: 16, fontWeight: '500', letterSpacing: 0.1 },
  // Mandatory for financial and numeric data:
  tabularNumeric: { fontVariant: ['tabular-nums'] as const },
};
```
