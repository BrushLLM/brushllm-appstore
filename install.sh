#!/bin/bash
# BrushLLM 1Panel 应用商店一键导入脚本
# 用法：bash install.sh
# 可选环境变量：PANEL_BASE_DIR（1Panel 安装基础目录，默认 /opt）
set -euo pipefail

REPO_URL="https://github.com/<owner>/brushllm-appstore.git"
PANEL_BASE_DIR="${PANEL_BASE_DIR:-/opt}"

# --- 前置检查 ---
if ! command -v git >/dev/null 2>&1; then
    echo "错误：未找到 git，请先安装（CentOS: yum install -y git / Ubuntu: apt install -y git）" >&2
    exit 1
fi

if [ ! -d "${PANEL_BASE_DIR}/1panel" ]; then
    echo "错误：未找到 ${PANEL_BASE_DIR}/1panel 目录。" >&2
    echo "如果 1Panel 安装在其他位置，请用环境变量指定，例如：" >&2
    echo "  PANEL_BASE_DIR=/your/path bash install.sh" >&2
    exit 1
fi

LOCAL_DIR="${PANEL_BASE_DIR}/1panel/resource/apps/local"
mkdir -p "${LOCAL_DIR}"

# --- 拉取仓库并复制应用包 ---
TMP_DIR=$(mktemp -d)
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "→ 正在拉取 BrushLLM 应用商店仓库..."
git clone --depth 1 "${REPO_URL}" "${TMP_DIR}/repo" >/dev/null 2>&1

if [ ! -d "${TMP_DIR}/repo/apps" ]; then
    echo "错误：仓库结构异常（未找到 apps 目录）" >&2
    exit 1
fi

echo "→ 正在导入应用到 ${LOCAL_DIR} ..."
cp -r "${TMP_DIR}"/repo/apps/* "${LOCAL_DIR}/"

# --- 完成 ---
APP_DIR="${LOCAL_DIR}/brushllm"
VERSIONS=$(ls -1 "${APP_DIR}" 2>/dev/null | grep -v -E 'data\.yml|logo|README' | tr '\n' ' ' || true)

echo ""
echo "✓ 导入完成！可用版本：${VERSIONS:-未找到}"
echo ""
echo "下一步："
echo "  1. 打开 1Panel 面板 → 应用商店"
echo "  2. 点击右上角【同步本地应用】按钮"
echo "  3. 在应用列表中找到 BrushLLM（带 Local 标签）并安装"
echo ""
echo "升级提示：应用发布新版本后，重新执行本脚本并再次【同步本地应用】，"
echo "已安装的应用会出现在【可升级】列表，升级自动保留数据。"
