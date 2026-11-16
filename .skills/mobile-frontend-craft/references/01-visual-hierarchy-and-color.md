# 01: Visual Hierarchy, Color & Anti-Slop Rules

Good mobile UI feels calm, legible, and intentional. AI slop happens when every element fights for attention with dark gradients, glowing blobs, pastel icon boxes, and unnecessary borders.

---

## 1. Color Restraint (1 Accent + Neutrals)

- **Default to clean, high-contrast surfaces:**
  - Light mode: `#FFFFFF` (surface), `#F5F5F7` or `#F7F8FA` (canvas), `#0F172A` / `#111827` (primary text), `#6B7280` (secondary text).
  - Dark mode (only when appropriate or requested): `#000000` / `#09090B` (canvas), `#141417` (surface), `#FAFAFA` (primary text), `#A1A1AA` (secondary text).
- **Use ONE primary brand accent** (e.g. Forest Green, Cobalt Blue, Deep Charcoal, or Warm Coral). Reserve semantic colors (emerald/red/amber) strictly for real status meaning (success, error, warning) — never for decorating random icons.
- **Banned AI Visual Clichés:**
  - NO purple-to-blue gradients (`#8A2BE2` → `#4169E1`).
  - NO blurred background glow blobs (`blur-3xl` circles) behind balance cards or headers.
  - NO rainbow pastel icon grids (4 action buttons each having a different `bg-blue-500/15`, `bg-emerald-500/15`, `bg-amber-500/15`, `bg-purple-500/15` square). Keep action icons monochrome or unified in one neutral tint.
  - NO translucent dot-pill spam (`bg-red-500/15 border border-red-500/30` with a `●` dot on every header/card like `● SOS`, `● PRIORITAS 1`, `● LIVE`). Use plain colored typography or clean solid buttons instead.
  - NO random 4px colored vertical stripes on card edges.
  - NO decorative `✨` sparkles or "AI-Powered" badges.

---

## 2. Typography & Numerical Clarity

- **Create clear hierarchy with scale and weight, not boxes:**
  - Hero / Balance: `32–36px`, bold/extrabold (`700–800`), tight tracking (`-0.02em`).
  - Screen Title: `20–24px`, bold (`700`).
  - Section Header: `13–15px`, semibold (`600`).
  - Body / Row Title: `15px`, medium/semibold (`500–600`).
  - Metadata / Subtitle: `12–13px`, regular (`400`), muted secondary color.
- **Financial & Numeric Discipline:**
  - Always use `font-variant-numeric: tabular-nums` on balances, prices, percentages, and timestamps so numbers align cleanly and never jitter.
  - Keep currency symbols (`Rp`, `$`) attached to amounts on a single line (`whitespace-nowrap`, `shrink-0`).
  - Avoid overusing monospace fonts for normal UI labels; reserve `font-sans` (Inter, SF Pro, Plus Jakarta Sans) for UI copy.

---

## 3. Spacing, Whitespace & Container Discipline

- Use a consistent **4pt / 8pt spacing scale** (`4, 8, 12, 16, 20, 24, 32`). Standard horizontal screen padding is `16px` or `20px`.
- **No Boxes Inside Boxes:** Don't wrap a list of items in a card where every row is *also* a bordered card with a bordered icon box inside it.
  - Either use clean full-width rows separated by subtle hairline dividers (`1px` at `6%–8%` opacity) on a flat canvas, OR one clean grouped surface card with inset dividers.
- **Concentric Corner Radii:** When nesting rounded elements, match their curvature:
  $$\text{Outer Radius} = \text{Inner Radius} + \text{Padding}$$
  (Example: `12px` inner element + `12px` padding = `24px` outer card.)

---

## 4. Iconography

- Use **one consistent icon family** per app (Lucide, Phosphor, Apple SF Symbols, or Material Symbols) with uniform stroke width (`1.75` or `2`).
- Never mix raw emojis (`💳`, `🚀`) with vector icons in navigation or action buttons.
