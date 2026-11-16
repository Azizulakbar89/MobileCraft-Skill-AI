<div align="center">
  <h1>📱 MobileCraft</h1>
  <p>
    <strong>Pure Mobile UI/UX Design Skill & Anti-Slop Ruleset for AI Coding Agents</strong><br>
    <em>Ubah AI agent Anda dari penghasil template generik menjadi Mobile UI/UX Designer berkelas studio.</em>
  </p>
  <p>
    <a href="https://github.com/Azizulakbar89/MobileCraft-Skill-AI/stargazers"><img src="https://img.shields.io/github/stars/Azizulakbar89/MobileCraft-Skill-AI?style=for-the-badge&logo=github&color=111827" alt="Stars"></a>
    <img src="https://img.shields.io/badge/Focus-Mobile%20UI%2FUX%20Only-EA580C?style=for-the-badge" alt="Focus Mobile UI/UX">
    <img src="https://img.shields.io/badge/Platforms-RN%20%7C%20Flutter%20%7C%20SwiftUI%20%7C%20Compose-047857?style=for-the-badge" alt="Platforms">
    <img src="https://img.shields.io/badge/SHA--256-Verified-2563EB?style=for-the-badge" alt="SHA-256 Verified">
  </p>
</div>

> **Author:** Ananda Azizul Akbar (@Azizulakbar89)  
> **Repository:** [Azizulakbar89/MobileCraft-Skill-AI](https://github.com/Azizulakbar89/MobileCraft-Skill-AI)

---

## 🎯 Kenapa Pakai MobileCraft?

Sebagian besar AI coding agent saat diminta membuat tampilan aplikasi mobile selalu menghasilkan **"AI Slop"** yang sama: gradasi ungu-biru neon, kotak ikon pastel warna-warni, badge titik transparan (`● LIVE`), status bar `09:41` palsu, kartu bertumpuk di dalam kartu, dan tombol tab yang tidak berfungsi.

**MobileCraft** membuang seluruh kebiasaan buruk tersebut. Skill ini mengarahkan AI (Antigravity, Cursor, Windsurf, Copilot, Claude Code) untuk fokus **100% pada desain tampilan & ergonomi UI/UX Mobile** — bersih, proporsional, interaktif, dan terasa seperti aplikasi native sungguhan.

---

## ⚡ Before vs After: AI Slop vs MobileCraft

| Aspek Desain | ❌ Output AI Bawaan (Slop) | ✅ Standar MobileCraft |
| :--- | :--- | :--- |
| **Warna & Permukaan** | Gradasi ungu-biru neon + `blur-3xl` glow di setiap kartu | **Restraint-First:** Light bersih (`#F5F5F7`) atau True OLED Dark (`#09090B`) + **1 warna aksen** |
| **Ikon & Aksi Cepat** | 4 kotak ikon pastel warna-warni (biru, hijau, kuning, ungu) | **Unified Monochrome:** 1 family ikon konsisten (Lucide, SF Symbols, Material Symbols) |
| **Badge & Status** | Spam pill transparan dengan titik (`● SOS`, `● PRIORITAS 1`) | Tipografi status yang bersih atau tombol solid tegas |
| **Hierarki Layout** | Kotak di dalam kotak (*container inception*) | Baris bersih dengan *hairline divider* `1px` & rumus *Concentric Radius* |
| **Ergonomi & Jempol** | Tombol aksi di pojok atas; target sentuh kecil | **Thumb-Zone Law:** CTA di 35% area bawah; target sentuh minimal `44×44pt` / `48×48dp` |
| **Navigasi & Sheet** | Tab bar tercampur tombol aksi; label terpotong di bawah | Tab bar murni *view switcher* + **Contextual Takeover** saat bottom sheet aktif |
| **Peta & Prototipe** | Tile ber-watermark `API KEY REQUIRED` & tab dummy mati | Tile publik bebas key (**Esri World Topo / OSM**) & seluruh tab berfungsi nyata |

---

## 🎨 Apa Saja yang Ada di Dalam Skill Ini?

### 1. 4 Palet Warna Terkalibrasi
AI otomatis memilih palet yang sesuai karakter aplikasi Anda:
- **Editorial Light** *(Fintech, Banking, Productivity)* — `#F5F5F7` canvas, `#FFFFFF` surface, `#111827` ink, `#047857` emerald.
- **Crisp Cobalt** *(E-Commerce, Travel, Booking)* — `#F8FAFC` canvas, `#2563EB` cobalt accent.
- **Warm Paper** *(Food, Lifestyle, Reading)* — `#FAF8F5` canvas, `#C2410C` terracotta accent.
- **True OLED Dark** *(Media, Crypto, Maps, Field Ops)* — `#09090B` canvas, `#141417` surface, kontras tinggi.

### 2. 5 Blueprint Tata Letak Aplikasi Mobile
- **Fintech & Banking:** Hero balance + *privacy toggle*, 4-action row, horizontal pockets, grouped inset transactions, bottom sheet transfer.
- **E-Commerce & Marketplace:** Sticky search + filter pills, 2-column product grid (`aspect-square`), sticky thumb-zone checkout bar.
- **Social & Chat:** Stories rail, clean feed rows, keyboard-docked chat input.
- **Maps, Ride-Hailing & Field Ops:** Full-bleed real map (`70%+` viewport), floating filter pills, docked bottom sheet dengan offset `fitBounds`.
- **Productivity & Health:** Date strip, 2-column summary metrics (`tabular-nums`), task checklist, floating `+` di kanan bawah.

### 3. Kompatibel Lintas Platform Mobile
- **React Native (Expo):** NativeWind v4, Unistyles, RN Reusables, `@gorhom/bottom-sheet`, Reanimated, FlashList, `expo-haptics`.
- **Flutter:** Material 3 / Cupertino, `SliverAppBar`, `showModalBottomSheet`, `AnimatedScale`, `HapticFeedback`.
- **iOS Native (SwiftUI):** SF Symbols, `NavigationStack`, `.presentationDetents`, `.sensoryFeedback()`.
- **Android Native (Jetpack Compose):** Material 3, `ModalBottomSheet`, `WindowInsets.safeDrawing`, `LazyColumn`.
- **Mobile Web Prototypes:** Clean `max-width: 430px`, `100dvh` responsive mobile shell tanpa bezel atau status bar palsu.

---

## 🚀 Cara Pemasangan (1 Menit)

### Quick Install via Terminal
Jalankan di root folder proyek Anda:

```bash
git clone https://github.com/Azizulakbar89/MobileCraft-Skill-AI.git .temp-mobilecraft
cp -r .temp-mobilecraft/.cursor .temp-mobilecraft/.skills .temp-mobilecraft/.windsurfrules .temp-mobilecraft/.github .
rm -rf .temp-mobilecraft
```

### Panduan per AI Agent
| AI Tool | Lokasi File | Cara Kerja |
| :--- | :--- | :--- |
| **Google Antigravity** | `.skills/mobile-frontend-craft/` *(atau `~/.gemini/antigravity/skills/`)* | Otomatis terbaca saat Anda meminta desain UI/UX mobile |
| **Cursor IDE** | `.cursor/rules/` (`mobile-ui-core.mdc`, `mobile-motion-ergonomics.mdc`) | Aktif otomatis (`alwaysApply: true`) di semua file UI |
| **Windsurf** | `.windsurfrules` | Otomatis diterapkan oleh Cascade di setiap generasi UI |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Mengarahkan Copilot Chat & inline suggestions |
| **Claude Code** | `.skills/mobile-frontend-craft/SKILL.md` | Referensikan di `CLAUDE.md` proyek Anda |

---

## 📂 Struktur Repositori

```text
MobileCraft-Skill-AI/
├── .cursor/rules/
│   ├── mobile-ui-core.mdc
│   └── mobile-motion-ergonomics.mdc
├── .github/
│   ├── copilot-instructions.md
│   └── workflows/verify-integrity.yml
├── .skills/mobile-frontend-craft/
│   ├── SKILL.md
│   └── references/
│       ├── 01-visual-hierarchy-and-color.md
│       ├── 02-mobile-ergonomics-and-navigation.md
│       ├── 03-components-and-states.md
│       ├── 04-motion-and-platform-idioms.md
│       └── 05-ui-libraries-palettes-and-layouts.md
├── .windsurfrules
├── README.md
├── SECURITY.md
├── checksums.sha256
└── scripts/
    ├── generate-manifest.sh
    ├── install-hooks.sh
    └── verify-integrity.sh
```

---

## 🔐 Verifikasi Integritas

Pastikan salinan skill Anda asli dan belum dimodifikasi:

```bash
./scripts/verify-integrity.sh
```

---

<p align="center">
  Dibuat oleh <strong>Ananda Azizul Akbar</strong> (<a href="https://github.com/Azizulakbar89">@Azizulakbar89</a>) • MIT License
</p>
