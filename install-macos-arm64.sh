#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.local/bin"
cp "$ROOT/cli/darwin-arm64/zhihu-cli" "$HOME/.local/bin/zhihu-cli"
chmod 755 "$HOME/.local/bin/zhihu-cli"
echo "知乎 CLI 已安装到 $HOME/.local/bin/zhihu-cli"
echo "请先阅读 skills/zhihu/SKILL.md，再配置 Access Secret。"
