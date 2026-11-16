# 01: Anti-Slop Guardrails & Architectural Pitfalls

This document defines forbidden visual and architectural patterns across Web, Hybrid, and Mobile applications.

---

## 1. Visual Slop Pitfalls (DILARANG)

### ❌ Pattern 1: The Electric Purple-Blue Gradient Hero
- **The Sin:** Linear gradients from `#8A2BE2` to `#4169E1` on buttons, card headers, or ambient background blobs.
- **The Fix:** Flat, high-contrast, confident surfaces. Use clean tonal backgrounds (`#FAFAFA` in light, `#0D0E11` in dark) with a single disciplined accent (Cobalt, Emerald, or Warm Terracotta).

### ❌ Pattern 2: Boxes Inside Boxes (Container Inception)
- **The Sin:** A screen wrapped in a card, containing a list of cards, each containing an icon container with a border.
- **The Fix:** Use **Gestalt proximity**. Group related items with consistent spacing (`gap: 12px` or `16px`). For lists, use **One Parent Card** with subtle inset dividers (`height: 1px`, `opacity: 0.08`), NOT individual bordered cards for each row.

### ❌ Pattern 3: Colored Vertical Stripe on Card Edges
- **The Sin:** A 4px vertical colored stripe on the left edge of a card to make it look "cool" without functional meaning.
- **The Fix:** Indicate status with a restrained pill badge (`paddingHorizontal: 8`, `paddingVertical: 4`, rounded full) or subtle icon tint. Never decorate structural cards with arbitrary stripes.

### ❌ Pattern 4: Decorative Sparkle (`✨`) Spam
- **The Sin:** Sprinkling `✨` or "AI-Powered" badges across headers, buttons, or search boxes.
- **The Fix:** Invisible intelligence. Let the output delight the user without decorative starbursts.

### ❌ Pattern 5: Mismatched Corner Radii
- **The Sin:** Parent card has `borderRadius: 12`, child inner image has `borderRadius: 24`, and an inner button has `borderRadius: 4`.
- **The Fix:** **Concentric Radius Rule:**
  $$\text{Outer Radius} = \text{Inner Radius} + \text{Padding}$$

---

## 2. Architectural & Code Slop Pitfalls (DILARANG)

### ❌ Pattern 6: The `useEffect` Data Fetching Slop
- **The Sin:** Writing raw `useEffect(() => { fetch('/api/data').then(...) }, [])` with multiple `useState` for loading, error, and data. Causes race conditions, missing cache, and zero optimistic updates.
- **The Fix:** Always use **TanStack Query (React Query)** or **SWR**.
  ```typescript
  // ✅ GOOD
  const { data, isLoading, error } = useQuery({ queryKey: ['wallet'], queryFn: fetchWallet });
  ```

### ❌ Pattern 7: The Uncontrolled 10-`useState` Form Slop
- **The Sin:** Managing forms with separate `const [email, setEmail] = useState('')` for every field, re-rendering the entire page on every keystroke with zero schema validation.
- **The Fix:** Always pair **React Hook Form** with **Zod** or **Valibot**.
  ```typescript
  // ✅ GOOD
  const form = useForm({ resolver: zodResolver(UserSchema) });
  ```

### ❌ Pattern 8: Monolithic Global State Slop
- **The Sin:** Putting local component states or server cache directly into monolithic Redux / Context, causing massive unnecessary re-render cascades across the app.
- **The Fix:** Separate concerns:
  - Server State: **TanStack Query**
  - Global Client State: **Zustand**
  - Atomic Fine-Grained State: **Jotai / Nanostores**
  - Local Transient UI: `useState`

### ❌ Pattern 9: The Desktop Table on Mobile Screen Slop
- **The Sin:** Squeezing an 8-column wide data table onto a 390px mobile viewport with horizontal scrollbars.
- **The Fix:** On mobile, transform table rows into **Bento Cards** or **Grouped Inset Lists**. If a table is strictly required, use **TanStack Table** with virtualized columns and sticky key identifiers.

### ❌ Pattern 10: Icon Hodgepodge
- **The Sin:** Mixing Material Icons, FontAwesome, SVG emojis, and random inconsistent SVGs in the same screen.
- **The Fix:** Strictly adhere to ONE icon family: **Lucide Icons** or **Phosphor Icons**, with uniform stroke widths ($1.75\text{–}2.0$).
