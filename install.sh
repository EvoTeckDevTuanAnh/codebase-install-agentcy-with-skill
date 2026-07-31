#!/usr/bin/env bash
# ============================================================
#  Codebase Install Agentcy with Skill - macOS/Linux installer
#  Cai dat: OpenCode CLI + 24 plugins + skills moi nhat tu provider
#  Cach chay:  bash install.sh
#  Hoac (1 lenh, khong can tai gi ca):
#    curl -fsSL https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.sh | bash
#  Chay lai bat ky luc nao -> tu dong cap nhat opencode, plugins, skills moi nhat.
# ============================================================
set -euo pipefail

CONFIG_DIR="${HOME}/.config/opencode"
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

# Repo skills chinh thuc cua cac nha cung cap (luon lay ban moi nhat tu main)
SKILL_REPOS=(
  "anthropics/skills"
  "openai/skills"
  "vercel-labs/agent-skills"
  "hashicorp/agent-skills"
  "supabase/agent-skills"
  "netlify/context-and-tools"
  "stripe/ai"
  "angular/skills"
  "VoltAgent/skills"
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
  last=$(( ${#PLUGINS[@]} - 1 ))
  for i in "${!PLUGINS[@]}"; do
    sep=","
    [ "$i" -eq "$last" ] && sep=""
    printf '    "%s"%s\n' "${PLUGINS[$i]}" "${sep}"
  done
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
  printf '    "@opencode-ai/plugin": "latest",\n'
  last=$(( ${#PLUGINS[@]} - 1 ))
  for i in "${!PLUGINS[@]}"; do
    sep=","
    [ "$i" -eq "$last" ] && sep=""
    printf '    "%s": "latest"%s\n' "${PLUGINS[$i]}" "${sep}"
  done
  printf '  }\n'
  printf '}\n'
} > "${CONFIG_DIR}/package.json"

(
  cd "${CONFIG_DIR}" || exit 1
  npm install
)
ok "Plugins da duoc cai dat"

# ------------------------------------------------------------
# 6. Tai skills moi nhat tu cac nha cung cap (git clone)
# ------------------------------------------------------------
step "Tai skills moi nhat tu cac nha cung cap"
if ! command -v git >/dev/null 2>&1 && ! command -v curl >/dev/null 2>&1; then
  warn "Thieu ca git va curl. Bo qua buoc tai skills (plugins van hoat dong)."
else
  TMP_DIR="$(mktemp -d)"
  TOTAL=0
  for repo in "${SKILL_REPOS[@]}"; do
    repo_name="${repo##*/}"
    echo "  - dang tai ${repo} ..."
    src=""

    # Cach 1: git clone (shallow)
    if command -v git >/dev/null 2>&1; then
      for attempt in 1 2 3; do
        [ "$attempt" -gt 1 ] && sleep $((3 * attempt))
        if git clone --depth 1 --quiet "https://github.com/${repo}.git" "${TMP_DIR}/${repo_name}-g${attempt}" 2>/dev/null; then
          src="${TMP_DIR}/${repo_name}-g${attempt}"
          break
        fi
      done
    fi

    # Cach 2: tai tarball tu codeload (endpoint khac, it bi gioi han hon)
    if [ -z "$src" ] && command -v curl >/dev/null 2>&1; then
      tgz="${TMP_DIR}/${repo_name}.tar.gz"
      tdir="${TMP_DIR}/${repo_name}-tgz"
      if curl -fsSL -o "$tgz" "https://codeload.github.com/${repo}/tar.gz/refs/heads/main" 2>/dev/null; then
        mkdir -p "$tdir"
        if tar -xzf "$tgz" -C "$tdir" --strip-components=1 2>/dev/null; then
          src="$tdir"
        fi
      fi
    fi

    if [ -z "$src" ]; then
      warn "  tai ${repo} that bai, bo qua. Chay lai script de thu lai."
      continue
    fi
    # Tim moi folder chua SKILL.md va copy nguyen folder (ke ca assets/reference files)
    while IFS= read -r f; do
      [ -n "$f" ] || continue
      d="$(dirname "$f")"
      name="$(basename "$d")"
      mkdir -p "${SKILL_DEST}"
      cp -R "$d" "${SKILL_DEST}/${name}"
      TOTAL=$((TOTAL+1))
    done < <(find "${src}" -name SKILL.md -type f)
    sleep 2
  done
  rm -rf "${TMP_DIR}"
  ok "Da dong bo ${TOTAL} skills (ban moi nhat) vao ${SKILL_DEST}"
fi

# ------------------------------------------------------------
# 7. Xong
# ------------------------------------------------------------
step "HOAN TAT"
ok "Cai dat thanh cong! Chay:  opencode"
echo "Cau hinh:  ${CONFIG_DIR}"
echo "Luon giu skills moi nhat bang cach chay lai script nay bat ky luc nao."
