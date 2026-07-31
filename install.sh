#!/usr/bin/env bash
# ============================================================
#  Codebase Install Agentcy with Skill - macOS/Linux installer
#  Cai dat: OpenCode CLI + 24 plugins + day du skills
#  Cach chay:  bash install.sh
# ============================================================
set -euo pipefail

CONFIG_DIR="${HOME}/.config/opencode"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="${SCRIPT_DIR}/skills"
SKILL_DEST="${CONFIG_DIR}/skills"

PLUGINS=(
  "opencode-chrome-devtools"
  "opencode-pty"
  "@prevalentware/opencode-goal-plugin"
  "opencode-swarm"
  "@zenobius/opencode-skillful"
  "opencode-goal-plugin"
  "opencode-kiro-auth"
  "@hueyexe/opencode-ensemble@0.16.0"
  "@morphllm/opencode-morph-plugin"
  "opencode-gemini-auth"
  "opencode-beads"
  "opencode-websearch-cited"
  "spotme"
  "opencode-sessions"
  "@ishaksebsib/opencode-tree"
  "opencode-rules"
  "opencode-ralph-loop"
  "opencode-browser"
  "@zenobius/opencode-background"
  "@howaboua/pickle-thinker"
  "opencode-rag-plugin"
  "opencode-plugin-litellm"
  "opencode-autosave-conversation"
  "opencode-relay"
)

step() { printf "\n==> %s\n" "$1"; }
ok()   { printf "[OK] %s\n" "$1"; }
warn() { printf "[!] %s\n" "$1"; }

# ------------------------------------------------------------
# 1. Kiem tra Node.js / npm
# ------------------------------------------------------------
step "Kiem tra Node.js / npm"
if ! command -v node >/dev/null 2>&1; then
  warn "Node.js chua duoc cai. Cai tu https://nodejs.org (ban >= 18) roi chay lai."
  exit 1
fi
if ! command -v npm >/dev/null 2>&1; then
  warn "npm chua duoc cai. Cai lai Node.js roi chay lai."
  exit 1
fi
ok "Node $(node --version) / npm $(npm --version)"

# ------------------------------------------------------------
# 2. Cai OpenCode CLI (npm global)
# ------------------------------------------------------------
step "Cai OpenCode CLI"
npm install -g opencode-ai@latest
ok "opencode $(opencode --version) da duoc cai"

# ------------------------------------------------------------
# 3. Tao thu muc cau hinh
# ------------------------------------------------------------
step "Tao thu muc cau hinh ${CONFIG_DIR}"
mkdir -p "${CONFIG_DIR}"

# ------------------------------------------------------------
# 4. Ghi file opencode.jsonc (24 plugins)
# ------------------------------------------------------------
step "Ghi file cau hinh opencode.jsonc"
{
  printf '{\n'
  printf '  "$schema": "https://opencode.ai/config.json",\n'
  printf '  "plugin": [\n'
  for p in "${PLUGINS[@]}"; do
    printf '    "%s",\n' "${p}"
  done
  # bo di dau phay o dong cuoi
  sed -i '' -e '$ s/,$//' "${CONFIG_DIR}/opencode.jsonc" 2>/dev/null || \
  sed -i -e '$ s/,$//' "${CONFIG_DIR}/opencode.jsonc" 2>/dev/null || true
  printf '  ]\n'
  printf '}\n'
} > "${CONFIG_DIR}/opencode.jsonc"
ok "Da ghi ${CONFIG_DIR}/opencode.jsonc (${#PLUGINS[@]} plugins)"

# ------------------------------------------------------------
# 5. Ghi package.json + npm install plugins
# ------------------------------------------------------------
step "Cai dat cac plugin tu npm"
{
  printf '{\n'
  printf '  "dependencies": {\n'
  printf '    "@opencode-ai/plugin": "1.18.10",\n'
  for p in "${PLUGINS[@]}"; do
    printf '    "%s": "latest",\n' "${p}"
  done
  # bo di dau phay o dong cuoi
  printf '  }\n'
  printf '}\n'
} > "${CONFIG_DIR}/package.json"
sed -i '' -e 's/,$//' "${CONFIG_DIR}/package.json" 2>/dev/null || \
sed -i -e 's/,$//' "${CONFIG_DIR}/package.json" 2>/dev/null || true

(
  cd "${CONFIG_DIR}" || exit 1
  npm install
)
ok "Plugins da duoc cai dat"

# ------------------------------------------------------------
# 6. Copy skills vao thu muc cau hinh
# ------------------------------------------------------------
step "Copy skills"
if [ -d "${SKILL_SRC}" ]; then
  if [ -d "${SKILL_DEST}" ]; then
    warn "Thu muc ${SKILL_DEST} da ton tai. Ghi de..."
    rm -rf "${SKILL_DEST}"
  fi
  cp -R "${SKILL_SRC}" "${SKILL_DEST}"
  SKILL_COUNT=$(find "${SKILL_DEST}" -type f | wc -l | tr -d ' ')
  ok "Da copy ${SKILL_COUNT} file skills vao ${SKILL_DEST}"
else
  warn "Khong tim thay thu muc skills ke ben script. Bo qua buoc copy skills."
fi

# ------------------------------------------------------------
# 7. Xong
# ------------------------------------------------------------
step "HOAN TAT"
ok "Cai dat thanh cong! Chay:  opencode"
echo "Cau hinh:  ${CONFIG_DIR}"
