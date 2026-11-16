# MobileCraft: Mobile UI/UX Instructions for GitHub Copilot

> Author: Ananda Azizul Akbar (@Azizulakbar89)  
> Repository: https://github.com/Azizulakbar89/MobileCraft-Skill-AI

Focus exclusively on clean, ergonomic, native-feeling **Mobile UI/UX Design** across React Native (Expo), Flutter, SwiftUI, Jetpack Compose, and mobile-first HTML/CSS prototypes. Do not generate backend logic unless asked.

## Core Rules
- **Color & Surface Restraint:** Use clean light or true dark surfaces with **one** primary brand accent and neutral grays. No purple-blue neon gradients, no `blur-3xl` glow blobs, no rainbow pastel icon grids, no translucent dot-pill spam (`bg-red-500/15 border-red-500/30 ●`), no decorative header logo boxes, and no boxes-inside-boxes.
- **Typography & Numbers:** Use font scale and `4pt/8pt` spacing for hierarchy. Enforce `tabular-nums`, `whitespace-nowrap`, and `shrink-0` on currency amounts and counters.
- **Concentric Radii:** `Outer Radius = Inner Radius + Padding`.
- **Ergonomics & Navigation:** Primary CTAs in the lower 35% thumb zone; minimum `44×44pt` / `48×48dp` tap targets; compact header (`<= 56px`); bottom tabs strictly for view switching (hide during checkout/transfer flows); use bottom sheets instead of `alert()`/`confirm()`.
- **No Fake Chrome or Dead UI:** In web prototypes, use a clean `max-width: 430px`, `100dvh` layout without fake `09:41` status bars, fake Dynamic Islands, or thick phone bezels. Make every visible tab and button actually work.
- **Icons & Motion:** Use one consistent icon family (Lucide, Phosphor, SF Symbols, or Material Symbols). Use subtle `0.97` spring press feedback without competing looping animations.
