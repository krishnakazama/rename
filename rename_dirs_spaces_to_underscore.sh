#!/usr/bin/env bash

# --------------------------------------------------
# Script: rename_dirs_spaces_to_underscore.sh
# Purpose: Rename directory names by replacing spaces with underscores
# Author: Krishnagaanth M
# Usage:
#   Dry run : ./rename_dirs_spaces_to_underscore.sh -n
#   Execute : ./rename_dirs_spaces_to_underscore.sh
# --------------------------------------------------

set -euo pipefail

# Check for GNU parallel
if ! command -v parallel >/dev/null 2>&1; then
    echo "❌ GNU parallel not found. Install it first:"
    echo "   sudo apt install parallel"
    exit 1
fi

# Dry run flag
DRY_RUN=""

if [[ "${1:-}" == "-n" || "${1:-}" == "--dry-run" ]]; then
    DRY_RUN="--dry-run"
    echo "🔍 Running in DRY RUN mode (no changes will be made)"
fi

echo "📁 Renaming directories (spaces → underscores)..."

find . -maxdepth 1 -type d -name "* *" -print0 | \
parallel -0 $DRY_RUN mv {} '{= s/ /_/g =}'

echo "✅ Done"
