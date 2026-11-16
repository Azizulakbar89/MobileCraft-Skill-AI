#!/usr/bin/env bash

# ==============================================================================
# MobileCraft AI - Manifest Generator for Authorized Author
# Author: Ananda Azizul Akbar (@Azizulakbar89)
# ==============================================================================

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

CHECKSUM_FILE="checksums.sha256"

echo "🔐 Menghasilkan SHA-256 Manifest baru untuk MobileCraft AI..."

shasum -a 256 \
  README.md \
  SECURITY.md \
  .windsurfrules \
  .github/copilot-instructions.md \
  .cursor/rules/mobile-ui-core.mdc \
  .cursor/rules/mobile-motion-ergonomics.mdc \
  .skills/mobile-frontend-craft/SKILL.md \
  .skills/mobile-frontend-craft/references/01-visual-hierarchy-and-color.md \
  .skills/mobile-frontend-craft/references/02-mobile-ergonomics-and-navigation.md \
  .skills/mobile-frontend-craft/references/03-components-and-states.md \
  .skills/mobile-frontend-craft/references/04-motion-and-platform-idioms.md \
  .skills/mobile-frontend-craft/references/05-ui-libraries-palettes-and-layouts.md \
  scripts/verify-integrity.sh \
  > "$CHECKSUM_FILE"

echo "✅ Berhasil disimpan ke $CHECKSUM_FILE"
cat "$CHECKSUM_FILE"
