# 📱 MobileCraft: Zero-Slop Mobile Frontend AI Skill Pack

<p align="center">
  <img src="https://img.shields.io/badge/Status-Production--Ready-emerald?style=for-the-badge" alt="Status">
  <img src="https://img.shields.io/badge/Supported-Cursor%20%7C%20Claude%20%7C%20Antigravity%20%7C%20Windsurf%20%7C%20Copilot-blue?style=for-the-badge" alt="Supported Agents">
  <img src="https://img.shields.io/badge/Stacks-React%20Native%20%7C%20Expo%20%7C%20Flutter-violet?style=for-the-badge" alt="Tech Stacks">
</p>

> **Eliminate "AI Slop" in mobile development forever.**  
> Transform Cursor, Claude Code, Google Antigravity, Windsurf, and GitHub Copilot into an elite **Mobile Principal UI/UX Engineer**. Produces clean, thumb-friendly, spring-animated mobile interfaces inspired by **Mobbin**, **Apple HIG**, and **Material 3 Expressive**.

---

## 🌐 Live Interactive Demo (Hasil Nyata Skill)

Anda dapat langsung mencoba hasil nyata dari skill ini secara interaktif melalui browser (file HTML sudah disertakan lengkap di dalam repo):

* 📱 **[Buka Live Mobile App Simulator](https://azizulakbar89.github.io/MobileCraft-Skill-AI/)** (File: [`index.html`](index.html))  
  *Simulasi interaktif aplikasi mobile nyata dengan 5 layar lengkap: Dompet Digital, Habit Tracker dengan progress ring dinamis, E-Commerce dengan variant selector, Wisata/Booking dengan search pill, dan Asisten AI dengan input sadar keyboard.*
* 🔍 **[Buka Benchmark & Audit Inspector](https://azizulakbar89.github.io/MobileCraft-Skill-AI/demo/benchmark.html)** (File: [`demo/benchmark.html`](demo/benchmark.html))  
  *Panel pengujian kepatuhan 8-poin audit anti-slop, inspeksi blueprint kode, dan verifikasi zero-slop.*

> 💡 **Cara mengaktifkan demo online di GitHub:**  
> Masuk ke repositori GitHub Anda $\rightarrow$ **Settings** $\rightarrow$ **Pages** $\rightarrow$ Pada bagian **Branch**, pilih `main` dan folder `/(root)`, lalu klik **Save**. Website demo Anda akan langsung aktif secara publik!

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

**MobileCraft stops this completely by enforcing an authoritative architecture of design tokens, concentric radii, spring physics, and thumb-first ergonomics.**

---

## 🚀 Panduan Penggunaan untuk Masing-Masing AI Agent

Folder ini dirancang secara **multi-agent native**. Cukup masukkan file yang sesuai ke repositori proyek mobile Anda:

### 1. 🖱️ Cursor IDE
Cursor membaca folder aturan khusus `.cursor/rules/*.mdc`.
* **Cara Pasang:**
  Salin folder `.cursor/` dari repo ini ke root proyek Anda:
  ```bash
  cp -r .cursor/ /path/to/your-mobile-project/
  ```
* **Cara Kerja:**
  File `.cursor/rules/mobile-ui-core.mdc` dan `mobile-motion-ergonomics.mdc` akan otomatis aktif setiap kali Anda mengedit atau membuat file `*.tsx`, `*.jsx`, `*.dart`, atau file di dalam `components/` dan `screens/`.
* **Hasil:**
  Setiap komponen React Native / Flutter yang dibuat Cursor otomatis memiliki:
  - Radius konsentris optik (`Outer = Inner + Padding`).
  - Animasi sentuh membal Reanimated (`scale: 0.97`) dan getaran haptic.
  - List teroptimasi (`FlashList` / `ListView.builder`).

---

### 2. 🤖 Claude Code (Anthropic CLI)
Claude Code menggunakan sistem instruksi berbasis direktori `.skills/` atau `CLAUDE.md`.
* **Cara Pasang:**
  Salin folder `.skills/` ke root proyek Anda:
  ```bash
  cp -r .skills/ /path/to/your-mobile-project/
  ```
  *(Opsional)* Anda juga dapat menautkannya langsung di file `CLAUDE.md`:
  ```markdown
  Read and strictly adhere to .skills/mobile-frontend-craft/SKILL.md for all mobile UI tasks.
  ```
* **Cara Kerja:**
  Claude Code akan membaca alur 4-tahap (`Phase 1: Token Check` $\rightarrow$ `Phase 2: Ergonomic Layout` $\rightarrow$ `Phase 3: Component Implementation` $\rightarrow$ `Phase 4: Anti-Slop Audit`) sebelum menuliskan kode apapun.
* **Hasil:**
  Claude Code tidak akan pernah menghasilkan kode "happy-path" saja; ia otomatis menyertakan 4 state wajib: **Loading (Skeleton Shimmer)**, **Empty State**, **Error Retry**, dan **Text Overflow Guard**.

---

### 3. 🛸 Google Antigravity
Antigravity mengenali format standar `SKILL.md` dengan metadata frontmatter YAML.
* **Cara Pasang:**
  Pastikan folder `.skills/mobile-frontend-craft/` berada di root workspace proyek Anda, atau letakkan di `~/.gemini/antigravity/skills/` untuk ketersediaan global.
* **Cara Kerja:**
  Antigravity secara otomatis mendeteksi skill `mobile-frontend-craft` saat Anda meminta pembuatan fitur antarmuka mobile.
* **Hasil:**
  Agent Antigravity akan merujuk dokumen referensi modular di `references/` untuk styling, physics springs, dan platform ergonomics tanpa menghabiskan konteks secara berlebihan (*progressive disclosure*).

---

### 4. 🌊 Windsurf IDE (Codeium)
Windsurf membaca file konfigurasi global aturan workspace di `.windsurfrules`.
* **Cara Pasang:**
  Salin file `.windsurfrules` ke root proyek Anda:
  ```bash
  cp .windsurfrules /path/to/your-mobile-project/
  ```
* **Cara Kerja:**
  AI Cascade pada Windsurf akan membaca 5 poin aturan emas MobileCraft di setiap giliran (*turn*), memastikan tidak ada layout box-in-box dan tombol aksi selalu berada di zona ibu jari.
* **Hasil:**
  Output kode widget Flutter atau komponen Expo yang dihasilkan Cascade langsung rapi dan siap masuk tahap produksi tanpa perlu revisi berulang.

---

### 5. 🐙 GitHub Copilot
GitHub Copilot membaca instruksi workspace melalui file `.github/copilot-instructions.md`.
* **Cara Pasang:**
  Salin folder `.github/` ke root repositori Anda:
  ```bash
  cp -r .github/ /path/to/your-mobile-project/
  ```
* **Cara Kerja:**
  Copilot Chat and inline completion akan menjadikan instruksi ini sebagai filter utama saat menyarankan kode frontend mobile.
* **Hasil:**
  Saran autocompletion otomatis menggunakan token warna semantik, touch target minimal 44pt, dan `tabular-nums` untuk angka.

---

## 🎨 Perbandingan Kualitas: Standar Bawaan vs MobileCraft

| Parameter | AI Default (Bawaan) | Dengan MobileCraft Skill |
| :--- | :--- | :--- |
| **Palet Warna** | Gradien ungu-neon acak, tombol glow | **Tonal Surface Hierarchy** (`Canvas` $\rightarrow$ `Surface` $\rightarrow$ `Elevated`) |
| **Pengelompokan List** | Kotak di dalam kotak bertumpuk (*card spam*) | **1 Card Induk** dengan *inset hairline divider* (standar Apple Settings) |
| **Ergonomi** | Tombol submit ditaruh di pojok atas | **Thumb-Zone Anchor**: CTA selalu di 35% area bawah layar |
| **Geometri Sudut** | Radius acak (4px, 12px, 30px campur) | **Concentric Rule**: `OuterRadius = InnerRadius + Padding` |
| **Karakter Angka** | Angka bergeser saat update saldo | Wajib `tabular-nums` / `FontFeature.tabularFigures()` |
| **Sentuhan & Fisik** | Kaku, flat, tanpa respons saat disentuh | **Spring Physics Scale (0.97)** + Haptic Feedback native |
| **Edge Cases** | Hanya kondisi ideal (*happy path*) | Wajib 4 state: **Skeleton Loading, Empty, Error, Overflow** |

---

## 📂 Struktur Repositori

```text
MobileCraft-Skill-AI/
├── .cursor/
│   └── rules/
│       ├── mobile-ui-core.mdc             # Aturan visual, warna, concentric radius
│       └── mobile-motion-ergonomics.mdc   # Aturan thumb-zone, safe area, spring physics
├── .github/
│   └── copilot-instructions.md            # Aturan resmi untuk GitHub Copilot
├── .skills/
│   └── mobile-frontend-craft/
│       ├── SKILL.md                       # Orchestrator alur kerja wajib & self-audit
│       └── references/
│           ├── 01-anti-slop-guardrails.md # Panduan larangan pola visual slop
│           ├── 02-design-tokens-themes.md # Grid 4pt/8pt & 4 preset tema terkurasi
│           ├── 03-component-blueprints.md # Blueprint kode siap pakai (React Native & Flutter)
│           ├── 04-motion-and-haptics.md   # Preset spring physics Reanimated & Haptics
│           └── 05-platform-ergonomics.md  # Safe Area, Dynamic Island & Keyboard avoidance
├── .windsurfrules                         # Aturan praktis untuk Windsurf Cascade
└── README.md                              # Dokumentasi lengkap
```

---

## 🧪 Contoh Prompt Pengujian

Setelah memasang skill ini di editor Anda, coba berikan prompt berikut ke AI agent Anda:

### 1. Fintech Wallet Card
> *"Buat komponen kartu saldo dompet digital dengan aksi cepat (Kirim, Top Up, QRIS, Analitik) dan daftar mutasi terakhir menggunakan tema Crisp Daylight dan FlashList."*

### 2. Habit Tracker Bento
> *"Rancang tampilan pelacak kebiasaan harian dengan layout Bento Grid asimetris, progress ring animasi, radius konsentris, dan tombol check-in haptic."*

### 3. E-Commerce Checkout Sheet
> *"Buat bottom sheet interaktif untuk checkout dengan pemilih varian warna, input catatan belanja dengan tombol clear, dan tombol sticky bayar di area jempol."*

---

## 📄 Lisensi
Distributed under the **MIT License**. Bebas digunakan untuk proyek personal, komersial, maupun agensi.
