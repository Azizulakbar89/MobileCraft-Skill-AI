# 06: The 7 Pillars Production Tech Stack Architecture

This manual establishes the mandatory stack combinations to produce zero-slop, production-grade applications across Web, Hybrid, and Mobile.

---

## Pillar 1: Core Frameworks & Meta-Frameworks

| Framework | Best-Fit Scope | Anti-Slop Architectural Rules |
| :--- | :--- | :--- |
| **Next.js (App Router)** | Modern Web & SSR/SSG | Use React Server Components (RSC) by default. Use `'use client'` strictly on interactive leaf components. Never nest heavy client state in layout roots. |
| **Nuxt (Vue 3)** | High-performance Web | Leverage `useAsyncData` / `useFetch` with built-in SSR caching. Use Composition API with `<script setup lang="ts">`. |
| **SvelteKit** | Ultra-lightweight reactive apps | Lean on Svelte 5 runes (`$state`, `$derived`, `$effect`) without virtual DOM overhead. Keep client bundle size minimal. |
| **React Native (Expo)** | Cross-platform Mobile | Use Expo Router with file-based navigation, typed routes, and Hermes engine. |
| **Flutter** | Native-speed Cross-platform Mobile | Utilize `CustomScrollView` with Slivers and `const` constructors to eliminate widget rebuild bottlenecks. |

---

## Pillar 2: Styling & UI Component Systems

- **Tailwind CSS:** The single source of truth for design tokens. Strictly use configured theme values (`spacing`, `colors`, `borderRadius`) rather than arbitrary magic numbers.
- **shadcn/ui (Web) & React Native Reusables (Mobile):** Copy-paste component architecture built on accessible headless primitives (Radix UI). Gives 100% control over component code without black-box npm dependencies.
- **Headless UI / Radix UI / Ark UI:** Supplies rock-solid ARIA keyboard accessibility and state logic. Style completely from scratch using MobileCraft concentric radius and depth tokens.
- **Ant Design & Material UI (MUI):** When requested for enterprise dashboards or complex internal tools, override default rigid themes: force $16\text{px}+$ border-radius, hairline borders, and thumb-friendly $44\text{pt}+$ touch targets.

---

## 3. Pillar 3: State Management (Client State)

Stop abusing `useState` prop-drilling or monolithic Redux for simple state:

1. **Zustand (Recommended Default):**
   ```typescript
   import { create } from 'zustand';
   
   interface CartState {
     items: CartItem[];
     addItem: (item: CartItem) => void;
     removeItem: (id: string) => void;
   }
   
   export const useCartStore = create<CartState>((set) => ({
     items: [],
     addItem: (item) => set((state) => ({ items: [...state.items, item] })),
     removeItem: (id) => set((state) => ({ items: state.items.filter((i) => i.id !== id) })),
   }));
   ```
2. **Jotai / Nanostores:** For fine-grained atomic state where micro-components re-render independently without re-rendering parent trees.
3. **Redux Toolkit (RTK):** Reserved for ultra-large enterprise codebases requiring strict time-travel debugging and normalized entity adapters.

---

## 4. Pillar 4: Data Fetching & Server State

**NEVER write raw `useEffect` + `useState` fetch slop!** Always manage cache, revalidation, and loading states using dedicated server-state engines:

1. **TanStack Query (React Query) — The Industry Standard:**
   ```typescript
   import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
   import { apiClient } from '@/lib/api';
   
   export function useTransactions() {
     return useQuery({
       queryKey: ['transactions'],
       queryFn: () => apiClient.get('/api/transactions').json<Transaction[]>(),
       staleTime: 1000 * 60 * 5, // 5 minutes fresh
     });
   }
   ```
2. **SWR:** Ultra-lightweight stale-while-revalidate fetching for Vercel/Next.js native workflows.
3. **Ky / Axios Client with Interceptors:**
   Always use HTTP clients with automatic authorization header injection and refreshed token handlers:
   ```typescript
   import ky from 'ky';
   
   export const apiClient = ky.create({
     prefixUrl: process.env.NEXT_PUBLIC_API_URL,
     hooks: {
       beforeRequest: [
         (request) => {
           const token = getAuthToken();
           if (token) request.headers.set('Authorization', `Bearer ${token}`);
         },
       ],
     },
   });
   ```

---

## 5. Pillar 5: Form Management & Schema Validation

Eliminate laggy forms and invalid payloads:

- **React Hook Form:** Uncontrolled form inputs with zero unnecessary re-renders.
- **Zod / Valibot:** End-to-end type inference and schema validation.

```typescript
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

export const TransferSchema = z.object({
  recipientAccount: z.string().min(8, 'Nomor rekening minimal 8 digit'),
  amount: z.number().positive('Nominal transfer harus lebih dari 0'),
  notes: z.string().max(100).optional(),
});

export type TransferFormData = z.infer<typeof TransferSchema>;

export function useTransferForm() {
  return useForm<TransferFormData>({
    resolver: zodResolver(TransferSchema),
    defaultValues: { recipientAccount: '', amount: 0 },
  });
}
```

---

## 6. Pillar 6: Animation & Visual Micro-Interactions

- **Motion (Framer Motion):** The gold standard for React & Next.js layout animations, modal entrances, and gesture drag interactions.
- **GSAP (GreenSock):** Reserved for complex timeline-based scrolling, SVG path morphing, and interactive canvas hero sections.
- **React Native Reanimated:** Mandatory for React Native so spring physics and gesture handlers execute natively on the UI Thread at 60–120 FPS.

---

## 7. Pillar 7: Data Visualization, Tables & Iconography

- **TanStack Table:** Headless table logic for sorting, filtering, and virtualized pagination without UI framework locks.
- **Recharts / Tremor / Apache ECharts:** Clean, accessible financial charts, area charts, and bar graphs styled with theme semantic tokens.
- **Lucide Icons / Phosphor Icons:** Only use vector icon packages that are tree-shakeable with uniform stroke weights (`1.75` or `2.0`). Never mix icon packs within the same screen.
