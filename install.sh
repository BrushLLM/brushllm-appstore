#!/bin/bash
# BrushLLM 1Panel app store one-line importer.
# Usage: bash install.sh
# Optional env: PANEL_BASE_DIR (1Panel install base directory, default /opt)
set -euo pipefail

REPO_URL="https://github.com/BrushLLM/brushllm-appstore.git"
PANEL_BASE_DIR="${PANEL_BASE_DIR:-/opt}"

# --- Preflight ---
if ! command -v git >/dev/null 2>&1; then
    echo "Error: git not found. Install it first (CentOS: yum install -y git / Ubuntu: apt install -y git)" >&2
    exit 1
fi

if [ ! -d "${PANEL_BASE_DIR}/1panel" ]; then
    echo "Error: ${PANEL_BASE_DIR}/1panel not found." >&2
    echo "If 1Panel is installed elsewhere, set the base directory, e.g.:" >&2
    echo "  PANEL_BASE_DIR=/your/path bash install.sh" >&2
    exit 1
fi

LOCAL_DIR="${PANEL_BASE_DIR}/1panel/resource/apps/local"
mkdir -p "${LOCAL_DIR}"

# --- Clone and copy the app package ---
TMP_DIR=$(mktemp -d)
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "-> Fetching the BrushLLM app store repository..."
git clone --depth 1 "${REPO_URL}" "${TMP_DIR}/repo" >/dev/null 2>&1

if [ ! -d "${TMP_DIR}/repo/apps" ]; then
    echo "Error: unexpected repository layout (apps/ directory not found)" >&2
    exit 1
fi

echo "-> Importing apps into ${LOCAL_DIR} ..."
cp -r "${TMP_DIR}"/repo/apps/* "${LOCAL_DIR}/"

# --- Done ---
APP_DIR="${LOCAL_DIR}/brushllm"
VERSIONS=$(ls -1 "${APP_DIR}" 2>/dev/null | grep -v -E 'data\.yml|logo|README' | tr '\n' ' ' || true)

echo ""
echo "OK - import complete. Available versions: ${VERSIONS:-none found}"
echo ""
echo "Next steps:"
echo "  1. Open the 1Panel panel -> App Store"
echo "  2. Click the [Sync Local Apps] button"
echo "  3. Find BrushLLM (Local tag) in the list and install it"
echo ""
echo "Upgrades: when a new version is published, re-run this script and"
echo "sync again - installed apps will show as upgradable, data is preserved."
