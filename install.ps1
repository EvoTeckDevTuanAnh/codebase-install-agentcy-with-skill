# ============================================================
#  Codebase Install Agentcy with Skill - Windows installer
#  Cai dat: OpenCode CLI + 24 plugins + day du skills
# ============================================================
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$ConfigDir  = Join-Path $HOME ".config\opencode"
$SkillSrc   = Join-Path $PSScriptRoot "skills"
$SkillDest  = Join-Path $ConfigDir "skills"

$Plugins = @(
    "opencode-chrome-devtools",
    "opencode-pty",
    "@prevalentware/opencode-goal-plugin",
    "opencode-swarm",
    "@zenobius/opencode-skillful",
    "opencode-goal-plugin",
    "opencode-kiro-auth",
    "@hueyexe/opencode-ensemble@0.16.0",
    "@morphllm/opencode-morph-plugin",
    "opencode-gemini-auth",
    "opencode-beads",
    "opencode-websearch-cited",
    "spotme",
    "opencode-sessions",
    "@ishaksebsib/opencode-tree",
    "opencode-rules",
    "opencode-ralph-loop",
    "opencode-browser",
    "@zenobius/opencode-background",
    "@howaboua/pickle-thinker",
    "opencode-rag-plugin",
    "opencode-plugin-litellm",
    "opencode-autosave-conversation",
    "opencode-relay"
)

function Write-Step($msg) { Write-Host "`n==> $msg" -ForegroundColor Cyan }
function Write-OK($msg)   { Write-Host "[OK] $msg" -ForegroundColor Green }
function Write-Warn($msg) { Write-Host "[!] $msg" -ForegroundColor Yellow }

# ------------------------------------------------------------
# 1. Kiem tra Node.js / npm
# ------------------------------------------------------------
Write-Step "Kiem tra Node.js / npm"
$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) {
    Write-Warn "Node.js chua duoc cai. Tai ve tu https://nodejs.org (ban >= 18) va chay lai script."
    exit 1
}
$npm = Get-Command npm -ErrorAction SilentlyContinue
if (-not $npm) {
    Write-Warn "npm chua duoc cai. Tai lai Node.js tu https://nodejs.org va chay lai script."
    exit 1
}
Write-OK ("Node " + (& node --version) + " / npm " + (& npm --version))

# ------------------------------------------------------------
# 2. Cai OpenCode CLI (npm global)
# ------------------------------------------------------------
Write-Step "Cai OpenCode CLI"
npm install -g opencode-ai@latest
if ($LASTEXITCODE -ne 0) { Write-Warn "Cai opencode-ai that bai."; exit 1 }
Write-OK ("opencode " + (& opencode --version) + " da duoc cai")

# ------------------------------------------------------------
# 3. Tao thu muc cau hinh
# ------------------------------------------------------------
Write-Step "Tao thu muc cau hinh $ConfigDir"
New-Item -ItemType Directory -Path $ConfigDir -Force | Out-Null

# ------------------------------------------------------------
# 4. Ghi file opencode.jsonc (24 plugins)
# ------------------------------------------------------------
Write-Step "Ghi file cau hinh opencode.jsonc"
$pluginList = ($Plugins | ForEach-Object { "    `"$_`"" }) -join ",`n"
$config = @"
{
  `"`$schema`": `"https://opencode.ai/config.json`",
  `"plugin`": [
$pluginList
  ]
}
"@
$configPath = Join-Path $ConfigDir "opencode.jsonc"
Set-Content -Path $configPath -Value $config -Encoding UTF8
Write-OK "Da ghi $configPath ($($Plugins.Count) plugins)"

# ------------------------------------------------------------
# 5. Ghi package.json + npm install plugins
# ------------------------------------------------------------
Write-Step "Cai dat cac plugin tu npm"
$depLines = ($Plugins | ForEach-Object { "    `"$_`":  `"latest`"" }) -join ",`n"
$pkg = @"
{
  `"dependencies`": {
    `"@opencode-ai/plugin`": `"1.18.10`",
$depLines
  }
}
"@
$pkgPath = Join-Path $ConfigDir "package.json"
Set-Content -Path $pkgPath -Value $pkg -Encoding UTF8

Push-Location $ConfigDir
try {
    npm install
    if ($LASTEXITCODE -ne 0) { Write-Warn "npm install plugins that bai. Xem log o tren." }
}
finally {
    Pop-Location
}
Write-OK "Plugins da duoc cai dat"

# ------------------------------------------------------------
# 6. Copy skills vao thu muc cau hinh
# ------------------------------------------------------------
Write-Step "Copy skills"
if (Test-Path -LiteralPath $SkillSrc) {
    if (Test-Path -LiteralPath $SkillDest) {
        Write-Warn "Thu muc $SkillDest da ton tai. Ghi de..."
        Remove-Item -LiteralPath $SkillDest -Recurse -Force
    }
    Copy-Item -LiteralPath $SkillSrc -Destination $SkillDest -Recurse -Force
    $skillCount = (Get-ChildItem -Path $SkillDest -Recurse -File).Count
    Write-OK "Da copy $skillCount file skills vao $SkillDest"
} else {
    Write-Warn "Khong tim thay thu muc skills ke ben script. Bo qua buoc copy skills."
}

# ------------------------------------------------------------
# 7. Xong
# ------------------------------------------------------------
Write-Step "HOAN TAT"
Write-Host "Cai dat thanh cong! Chay:  opencode" -ForegroundColor Green
Write-Host "Cau hinh:  $ConfigDir" -ForegroundColor DarkGray
