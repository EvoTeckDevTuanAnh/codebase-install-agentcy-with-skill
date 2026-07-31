# ============================================================
#  Codebase Install Agentcy with Skill - Windows installer
#  Cai dat: OpenCode CLI + 24 plugins + skills moi nhat tu provider
#  Cach chay:  powershell -ExecutionPolicy Bypass -File install.ps1
#  Hoac (1 lenh, khong can tai gi ca):
#    irm https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.ps1 | iex
#  Chay lai bat ky luc nao -> tu dong cap nhat opencode, plugins, skills moi nhat.
# ============================================================
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$ConfigDir  = Join-Path $HOME ".config\opencode"
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

# Repo skills chinh thuc cua cac nha cung cap (luon lay ban moi nhat tu main)
$SkillRepos = @(
    "anthropics/skills",
    "openai/skills",
    "vercel-labs/agent-skills",
    "hashicorp/agent-skills",
    "supabase/agent-skills",
    "netlify/context-and-tools",
    "stripe/ai",
    "angular/skills",
    "VoltAgent/skills"
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
    `"@opencode-ai/plugin`": `"latest`",
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
# 6. Tai skills moi nhat tu cac nha cung cap (git clone)
# ------------------------------------------------------------
Write-Step "Tai skills moi nhat tu cac nha cung cap"
$tmp = Join-Path $env:TEMP ("opencode-skills-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
$total = 0
try {
    foreach ($repo in $SkillRepos) {
        $repoName = ($repo -split "/")[1]
        Write-Host "  - dang tai $repo ..."
        $src = $null

        # Cach 1: git clone (shallow)
        $git = Get-Command git -ErrorAction SilentlyContinue
        if ($git) {
            foreach ($attempt in 1..3) {
                if ($attempt -gt 1) { Start-Sleep -Seconds (3 * $attempt) }
                $tryDir = Join-Path $tmp ($repoName + "-g" + $attempt)
                git clone --depth 1 --quiet "https://github.com/$repo.git" $tryDir
                if ($LASTEXITCODE -eq 0) { $src = $tryDir; break }
            }
        }

        # Cach 2: tai tarball tu codeload (endpoint khac, it bi gioi han hon)
        if (-not $src) {
            $tgz = Join-Path $tmp ($repoName + ".tar.gz")
            try {
                Invoke-WebRequest -Uri "https://codeload.github.com/$repo/tar.gz/refs/heads/main" -OutFile $tgz -UseBasicParsing -ErrorAction Stop
                $tdir = Join-Path $tmp ($repoName + "-tgz")
                New-Item -ItemType Directory -Path $tdir -Force | Out-Null
                & tar.exe -xzf $tgz -C $tdir --strip-components=1
                if ($LASTEXITCODE -eq 0) { $src = $tdir }
            } catch {
                $src = $null
            }
        }

        if (-not $src) { Write-Warn "  tai $repo that bai, bo qua. Chay lai script de thu lai."; continue }

        # Tim moi folder chua SKILL.md va copy nguyen folder (ke ca assets/reference files)
        $seen = @{}
        $skillDirs = Get-ChildItem -Path $src -Recurse -Filter SKILL.md -File -ErrorAction SilentlyContinue | ForEach-Object {
            $fn = $_.Directory.FullName
            if (-not $seen.ContainsKey($fn)) { $seen[$fn] = $true; $fn }
        }
        foreach ($d in $skillDirs) {
            $dest = Join-Path $SkillDest (Split-Path $d -Leaf)
            Copy-Item -LiteralPath $d -Destination $dest -Recurse -Force
            $total++
        }
        Start-Sleep -Seconds 2
    }
    Write-OK "Da dong bo $total skills (ban moi nhat) vao $SkillDest"
}
finally {
    Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
}

# ------------------------------------------------------------
# 7. Xong
# ------------------------------------------------------------
Write-Step "HOAN TAT"
Write-Host "Cai dat thanh cong! Chay:  opencode" -ForegroundColor Green
Write-Host "Cau hinh:  $ConfigDir" -ForegroundColor DarkGray
Write-Host "Luon giu skills moi nhat bang cach chay lai script nay bat ky luc nao." -ForegroundColor DarkGray
