#!/usr/bin/env bash

# ==============================================================================
# MobileCraft AI - Cryptographic Integrity & Anti-Tamper Verification Engine
# Author: Ananda Azizul Akbar (@Azizulakbar89)
# ==============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

CHECKSUM_FILE="checksums.sha256"
AUTHOR_SIGNATURE="Ananda Azizul Akbar (@Azizulakbar89)"

echo "======================================================================"
echo " 🔐 MobileCraft Cryptographic Integrity & Provenance Verifier"
echo "======================================================================"
echo "Target Root: $REPO_ROOT"
echo ""

# 1. Check Watermark in Core Files
echo "[1/2] Memeriksa Tanda Air Kriptografis (Watermark Check)..."

PROTECTED_FILES=(
  "README.md"
  ".skills/mobile-frontend-craft/SKILL.md"
  ".cursor/rules/mobile-ui-core.mdc"
  ".cursor/rules/mobile-motion-ergonomics.mdc"
  ".github/copilot-instructions.md"
  ".windsurfrules"
)

WATERMARK_FAILED=0

for file in "${PROTECTED_FILES[@]}"; do
  if [ ! -f "$file" ]; then
    echo "  ❌ Berkas hilang: $file"
    WATERMARK_FAILED=1
    continue
  fi

  if ! grep -q "$AUTHOR_SIGNATURE" "$file"; then
    echo "  ❌ SEGEL RUSAK / WATERMARK HILANG: $file"
    WATERMARK_FAILED=1
  else
    echo "  ✅ Watermark Sah: $file"
  fi
done

if [ "$WATERMARK_FAILED" -ne 0 ]; then
  echo ""
  echo "🚨 [FATAL ERROR]: Tanda tangan kepemilikan Ananda Azizul Akbar telah dimodifikasi atau dihapus!"
  exit 1
fi

echo ""
echo "[2/2] Memverifikasi SHA-256 Hash Manifest..."

if [ ! -f "$CHECKSUM_FILE" ]; then
  echo "🚨 Berkas manifest $CHECKSUM_FILE tidak ditemukan!"
  exit 1
fi

# Detect shasum command (macOS / Linux compatibility)
if command -v shasum >/dev/null 2>&1; then
  SHA_CMD="shasum -a 256 -c"
elif command -v sha256sum >/dev/null 2>&1; then
  SHA_CMD="sha256sum -c"
else
  echo "🚨 Perintah 'shasum' atau 'sha256sum' tidak tersedia pada sistem ini."
  exit 1
fi

if $SHA_CMD "$CHECKSUM_FILE"; then
  echo ""
  echo "======================================================================"
  echo " 🎉 [STATUS: 100% AUTHENTIC & VERIFIED]"
  echo " Seluruh berkas MobileCraft identik dengan segel asli Ananda Azizul Akbar."
  echo " Tidak ada indikasi tampering atau modifikasi ilegal."
  echo "======================================================================"
  exit 0
else
  echo ""
  echo "🚨 [CRITICAL ALERT: TAMPER DETECTED]"
  echo " Terdapat berkas yang telah dimodifikasi tanpa otorisasi kriptografis!"
  exit 1
fi
