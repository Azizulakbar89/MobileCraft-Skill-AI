# 📱 MobileCraft: Universal Zero-Slop Mobile Frontend AI Skill Pack

<p align="center">
  <img src="https://img.shields.io/badge/Status-Production--Ready-emerald?style=for-the-badge" alt="Status">
  <img src="https://img.shields.io/badge/Languages-TS%2FJS%20%7C%20Dart%20%7C%20Swift%20%7C%20Kotlin-blue?style=for-the-badge" alt="Languages">
  <img src="https://img.shields.io/badge/Frameworks-React%20Native%20%7C%20Flutter%20%7C%20SwiftUI%20%7C%20Compose%20%7C%20PWA-violet?style=for-the-badge" alt="Frameworks">
</p>

> **Eliminate "AI Slop" across ANY mobile language and framework.**  
> Transform Cursor, Claude Code, Google Antigravity, Windsurf, and GitHub Copilot into an elite **Universal Mobile Principal UI/UX Architect**.  
> Produces clean, thumb-friendly, spring-animated mobile interfaces inspired by **Mobbin**, **Apple HIG**, and **Material 3 Expressive**.

---

## 📚 Pustaka UI Unggulan yang Didukung (Curated Libraries)

MobileCraft menyertakan panduan khusus untuk menghilangkan *slop bawaan* dari 6 pustaka komponen populer saat dipakai untuk antarmuka mobile:

| Nama Pustaka | Pendekatan Utama | Kelebihan Utama & Peran di MobileCraft |
| :--- | :--- | :--- |
| **[daisyUI](https://daisyui.com/)** | Plugin kelas komponen untuk Tailwind CSS | Ringan tanpa membawa JavaScript tambahan dan mendukung multi-theme instan. Di-tuning agar warna tidak *oversaturated* dan mengikuti sistem token kedalaman. |
| **[HeroUI](https://www.heroui.com/)** *(NextUI)* | Pustaka komponen berbasis Tailwind & React Aria | Tampilan modern dengan animasi halus bawaan yang siap pakai tanpa banyak konfigurasi. Dioptimalkan agar bebas dari efek blur *glassmorphism* berlebihan. |
| **[Radix UI](https://www.radix-ui.com/)** / **[Headless UI](https://headlessui.com/)** | Komponen headless (tanpa gaya bawaan) | Kebebasan desain 100% dari nol dengan logika interaksi & aksesibilitas teruji. Diberikan styling *concentric radius* dan *bottom sheet drawer*. |
| **[Mantine](https://mantine.dev/)** | Pustaka komponen React lengkap *(full-featured)* | Menyediakan lebih dari 100 komponen dan hooks kompleks (DataTable, Charts, Rich Text Editor). Diadaptasi agar tabel dan dialog desktop otomatis menjadi kartu mobile. |
| **[Material UI (MUI)](https://mui.com/)** | Sistem desain berbasis Google Material Design | Ekosistem sangat matang dengan dokumentasi lengkap untuk aplikasi skala besar. Di-override agar tidak bergaya kotak kaku bawaan tahun 2014. |
| **[Ant Design](https://ant.design/)** | Sistem desain tingkat perusahaan *(enterprise)* | Sangat kuat untuk membangun dashboard admin, CRM, dan sistem internal yang padat data. Disesuaikan dengan batas sentuh jari manusia ($44\text{pt}+$ touch target). |

---

## 🌍 Kompatibilitas Lintas Bahasa Pemrograman Mobile

Skill ini **tidak terikat pada satu bahasa saja**. MobileCraft dirancang dengan arsitektur aturan universal yang dapat diterapkan pada bahasa apapun yang mampu membangun aplikasi mobile:

```
┌────────────────────────────────────────────────────────────────────────┐
│                   MobileCraft Core Rules Engine                        │
│   (Thumb-Zone + Concentric Radius + Spring Physics + Tabular Nums)     │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
      ┌────────────────────────────┼────────────────────────────┐
      ▼                            ▼                            ▼
[TypeScript / JS]               [Dart]                  [Swift & Kotlin]
• React Native / Expo         • Flutter                 • iOS (SwiftUI)
• PWA / Capacitor / Ionic     • Material 3              • Android (Jetpack Compose)
(daisyUI, HeroUI, Radix,      (Slivers, BouncingScroll, (Liquid Glass, Spring Physics,
 Mantine, MUI, AntD)           AnimatedScale, Haptics)   SensoryFeedback, M3 Surface)
```

| Bahasa | Ekosistem / Framework | Implementasi Komponen MobileCraft |
| :--- | :--- | :--- |
| **TypeScript / JavaScript** | **React Native & Expo** | `react-native-reanimated` (Springs), `expo-haptics`, `@shopify/flash-list`, NativeWind. |
| **TypeScript / JavaScript** | **Mobile Web / PWA / Capacitor / Ionic** | Tailwind CSS + **daisyUI / HeroUI / Radix / Mantine / MUI / Ant Design** + Framer Motion. |
| **Dart** | **Flutter** | `AnimatedScale` (Scale 0.97), `HapticFeedback`, `ListView.builder`, `CustomScrollView`. |
| **Swift** | **iOS Native (SwiftUI)** | `.spring(response:dampingRatio:)`, `.sensoryFeedback()`, `LazyVStack`, safe area insets. |
| **Kotlin** | **Android Native (Jetpack Compose)** | `spring()`, `LocalHapticFeedback.current`, `LazyColumn`, Material 3 Expressive surfaces. |

---

## ⚡ The Problem: What is "Mobile AI Slop"?

Standard LLMs are trained mostly on desktop web landing pages. When asked to write mobile code, they default to:
* ❌ **Neon purple-to-blue gradients** slapped on buttons and hero headers.
* ❌ **Boxes inside boxes** (nesting cards inside cards inside cards).
* ❌ **Arbitrary colored stripes** on the left edge of cards.
* ❌ **Trapped top-corner buttons** unreachable by human thumbs.
* ❌ **Static, lifeless buttons** with no press feedback, spring physics, or haptics.
* ❌ **Numbers jumping around** because the AI forgot tabular numbers (`tabular-nums`).
* ❌ **Ignoring safe areas** (content crashing into iPhone Dynamic Island / notch / home indicator).

---

## 🚀 Panduan Penggunaan untuk Masing-Masing AI Agent

### 1. 🖱️ Cursor IDE
* **File:** `.cursor/rules/mobile-ui-core.mdc` & `mobile-motion-ergonomics.mdc`.
* **Cakupan File:** Otomatis aktif pada `*.tsx`, `*.jsx`, `*.dart`, `*.swift`, `*.kt`, `*.vue`, `*.svelte`.
* **Hasil:** Komponen mobile langsung memiliki radius konsentris optik, tombol membal Reanimated/SwiftUI/Flutter, dan daftar tervirtualisasi.

### 2. 🤖 Claude Code (Anthropic CLI)
* **File:** `.skills/mobile-frontend-craft/SKILL.md` & `references/`.
* **Cara Pakai:** Salin folder `.skills/` ke root proyek. Tautkan di `CLAUDE.md`:
  ```markdown
  Read and strictly adhere to .skills/mobile-frontend-craft/SKILL.md for all mobile UI tasks.
  ```
* **Hasil:** Claude Code mengeksekusi pipeline 4-tahap wajib dan selalu menangani 4 state: **Skeleton Loading, Empty, Error Retry, Overflow**.

### 3. 🛸 Google Antigravity
* **File:** `.skills/mobile-frontend-craft/SKILL.md`.
* **Cara Pakai:** Taruh di folder proyek atau di `~/.gemini/antigravity/skills/`.
* **Hasil:** Antigravity secara otomatis memanggil referensi token desain, aturan library, dan fisika gerak secara efisien (*progressive disclosure*).

### 4. 🌊 Windsurf IDE (Codeium)
* **File:** `.windsurfrules`.
* **Cara Pakai:** Salin `.windsurfrules` ke root proyek Anda.
* **Hasil:** AI Cascade membaca aturan emas MobileCraft pada setiap putaran kode, mencegah layout box-in-box dan tombol kaku.

### 5. 🐙 GitHub Copilot
* **File:** `.github/copilot-instructions.md`.
* **Cara Pakai:** Salin folder `.github/` ke repositori Anda.
* **Hasil:** Autocompletion dan Copilot Chat otomatis memprioritaskan touch target 44pt+, tabular numbers, dan safe areas.

---

## 🎨 Perbandingan Kualitas: Bawaan AI vs MobileCraft

| Parameter | AI Default (Bawaan) | Dengan MobileCraft Skill |
| :--- | :--- | :--- |
| **Palet Warna** | Gradien ungu-neon acak, tombol glow | **Tonal Surface Hierarchy** (`Canvas` $\rightarrow$ `Surface` $\rightarrow$ `Elevated`) |
| **Pengelompokan List** | Kotak di dalam kotak bertumpuk (*card spam*) | **1 Card Induk** dengan *inset hairline divider* (standar Apple Settings) |
| **Ergonomi** | Tombol submit ditaruh di pojok atas | **Thumb-Zone Anchor**: CTA selalu di 35% area bawah layar |
| **Geometri Sudut** | Radius acak (4px, 12px, 30px campur) | **Concentric Rule**: `OuterRadius = InnerRadius + Padding` |
| **Karakter Angka** | Angka bergeser saat update saldo | Wajib `tabular-nums` / `FontFeature.tabularFigures()` / `.monospacedDigit()` |
| **Sentuhan & Fisik** | Kaku, flat, tanpa respons saat disentuh | **Spring Physics Scale (0.97)** + Haptic Feedback native lintas bahasa |
| **Edge Cases** | Hanya kondisi ideal (*happy path*) | Wajib 4 state: **Skeleton Loading, Empty, Error, Overflow** |

---

## 📂 Struktur Repositori

```text
MobileCraft-Skill-AI/
├── .cursor/
│   └── rules/
│       ├── mobile-ui-core.mdc             # Aturan visual, palet warna, concentric radius (Universal)
│       └── mobile-motion-ergonomics.mdc   # Aturan thumb-zone, safe area, spring physics
├── .github/
│   └── copilot-instructions.md            # Aturan resmi untuk GitHub Copilot
├── .skills/
│   └── mobile-frontend-craft/
│       ├── SKILL.md                       # Orchestrator alur kerja wajib & library rules
│       └── references/
│           ├── 01-anti-slop-guardrails.md # Panduan larangan pola slop & audit tiap library
│           ├── 02-design-tokens-themes.md # Grid 4pt/8pt & pemetaan TS/Dart/Swift/Kotlin
│           ├── 03-component-blueprints.md # Blueprint kode siap pakai lintas bahasa & library
│           ├── 04-motion-and-haptics.md   # Preset spring physics Reanimated, Flutter, SwiftUI, Compose
│           └── 05-platform-ergonomics.md  # Safe Area, Dynamic Island & Keyboard avoidance
├── .windsurfrules                         # Aturan praktis untuk Windsurf Cascade
└── README.md                              # Dokumentasi lengkap
```

---

## 📄 Lisensi
Distributed under the **MIT License**. Bebas digunakan untuk proyek personal, komersial, maupun agensi.
