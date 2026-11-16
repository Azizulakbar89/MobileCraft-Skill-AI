# 🔐 Security, Cryptographic Provenance & Tamper-Proofing Policy

## 1. Keaslian & Hak Cipta Kriptografis (Cryptographic Provenance)

Repositori **MobileCraft AI** (`MobileCraft-Skill-AI`) dilindungi oleh sistem segel kriptografis berbasis **SHA-256 Manifest**:

- **Pencipta & Pemegang Hak:** Ananda Azizul Akbar ([@Azizulakbar89](https://github.com/Azizulakbar89))
- **Repositori Resmi:** `https://github.com/Azizulakbar89/MobileCraft-Skill-AI`
- **Algoritma Verifikasi:** SHA-256 Hash Digest & Cryptographic Provenance Header

Setiap berkas inti (aturan AI, skill definitions, dan referensi arsitektur) memuat tanda air digital (*Digital Watermark Seal*) yang merujuk pada pembuat aslinya.

---

## 2. Cara Memverifikasi Keaslian Berkas (Tamper Detection)

Untuk memastikan bahwa salinan berkas ini murni, tidak disusupi skrip asing, dan belum dimodifikasi oleh pihak ketiga:

```bash
# Melalui script otomatis:
chmod +x ./scripts/verify-integrity.sh
./scripts/verify-integrity.sh

# Atau verifikasi langsung melalui utilitas standar sistem operasi:
shasum -a 256 -c checksums.sha256
```

Jika terdapat berkas yang telah dirusak, dipalsukan, atau dihapus watermark-nya, skrip akan mengembalikan status:
```text
❌ [CRITICAL ALERT: TAMPER DETECTED]
Integritas berkas tidak cocok dengan segel asli Ananda Azizul Akbar!
```

---

## 3. Langkah Pengamanan Tambahan untuk Pemilik Repositori

Agar repositori di GitHub **sama sekali tidak bisa diubah oleh orang lain**:

### A. Aktifkan GitHub Branch Protection Rules
1. Buka repositori di GitHub: `Settings` $\rightarrow$ `Branches` $\rightarrow$ `Add branch protection rule`.
2. Pada **Branch name pattern**, ketik `main`.
3. Centang opsi berikut:
   - ✅ **Require a pull request before merging**
   - ✅ **Require status checks to pass before merging** (pilih workflow `verify-integrity`)
   - ✅ **Require signed commits** (hanya commit yang ditandatangani GPG/SSH pribadi Anda yang diizinkan)
   - ✅ **Do not allow bypassing the above settings**
   - ✅ **Restrict who can push to matching branches** (hanya akun `@Azizulakbar89`)

### B. Pasang Tandatangan Komit Git (GPG / SSH Commit Signing)
Pastikan setiap komit yang Anda buat ditandatangani secara kriptografis:
```bash
git config --global user.signingkey <GPG_KEY_ID_ATAU_SSH_KEY>
git config --global commit.gpgsign true
```

Dengan konfigurasi ini, pihak lain tidak dapat melakukan *spoofing* identitas atau memalsukan komit atas nama Anda.
