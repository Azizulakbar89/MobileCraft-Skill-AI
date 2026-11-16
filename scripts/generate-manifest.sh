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

# Hash only tracked source files, exclude git, node_modules, and checksum file itself
shasum -a 256 \
  README.md \
  SECURITY.md \
  index.html \
  .windsurfrules \
  .github/copilot-instructions.md \
  .cursor/rules/mobile-ui-core.mdc \
  .cursor/rules/mobile-motion-ergonomics.mdc \
  .skills/mobile-frontend-craft/SKILL.md \
  .skills/mobile-frontend-craft/references/01-anti-slop-guardrails.md \
  .skills/mobile-frontend-craft/references/02-design-tokens-themes.md \
  .skills/mobile-frontend-craft/references/03-component-blueprints.md \
  .skills/mobile-frontend-craft/references/04-motion-and-haptics.md \
  .skills/mobile-frontend-craft/references/05-platform-ergonomics.md \
  .skills/mobile-frontend-craft/references/06-fullstack-frontend-stack.md \
  .skills/mobile-frontend-craft/references/07-auth-security-offline.md \
  .skills/mobile-frontend-craft/references/08-realtime-media-hardware.md \
  .skills/mobile-frontend-craft/references/09-a11y-i18n-observability.md \
  .skills/mobile-frontend-craft/references/10-domain-archetypes-and-resources.md \
  scripts/verify-integrity.sh \
  > "$CHECKSUM_FILE"

echo "✅ Berhasil disimpan ke $CHECKSUM_FILE"
cat "$CHECKSUM_FILE"
