# 03: Mobile Components, States & Interactive Completeness

Every mobile screen should look refined across all states and feel genuinely responsive to user input.

---

## 1. Interactive Completeness (No Dead UI)

- **Every visible control must work:** In interactive prototypes, every tab in the bottom bar, every quick action, and every filter chip should switch to a real view or trigger a real UI state change. Never wire visible navigation tabs to dummy `"Coming soon"` toasts.
- **Keep data realistic and clean:** Use realistic, concise labels and domain-appropriate formatting without filler buzzwords.

---

## 2. Core Mobile Patterns

- **Clean List Rows:**
  - Left: simple monochrome or subtle tinted avatar/icon (`40×40px`, `rounded-full` or `rounded-xl`).
  - Middle: primary title (`15px`, semibold) + 1 line of muted metadata (`12–13px`).
  - Right: primary metric/amount (`tabular-nums`, `whitespace-nowrap`) + optional subtle status text.
  - Separator: `1px` inset hairline divider aligned with the text column.
- **Segmented Controls & Filter Pills:**
  - Use horizontal pill chips (`min-height: 36px`, `padding: 0 14px`) for quick filters (e.g., Semua, Masuk, Keluar) instead of desktop `<select>` dropdowns.
- **Sticky Bottom Action Bar:**
  - Anchor primary confirmation buttons cleanly at the bottom with safe-area padding and a subtle top border or backdrop blur.

---

## 3. Essential Visual States

Always design beyond the happy path:
1. **Loading State:** Shape-matched skeleton shimmer placeholders with explicit dimensions to avoid layout shift.
2. **Empty State:** Clean icon or illustration, clear 1-line explanation, and a primary button to resolve (e.g. "Reset Filter").
3. **Error State:** Clear, human-readable message with a non-destructive retry action.
4. **Accessibility & Font Scaling:** Use `min-height` instead of fixed `height` on text buttons and cards so text can scale up without clipping. Maintain at least `4.5:1` contrast for body text.
