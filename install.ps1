# === 1 file duy nhat - Copy paste vao terminal ===

Write-Host "=== Buoc 1: Cai dat 26 plugins tu npm ===" -ForegroundColor Cyan
pnpm add -w opencode-chrome-devtools@latest opencode-pty @prevalentware/opencode-goal-plugin opencode-swarm @zenobius/opencode-skillful opencode-goal-plugin opencode-kiro-auth @hueyexe/opencode-ensemble@0.16.0 @morphllm/opencode-morph-plugin opencode-gemini-auth opencode-beads opencode-websearch-cited spotme opencode-sessions @ishaksebsib/opencode-tree opencode-rules opencode-ralph-loop opencode-auto-resume opencode-browser @zenobius/opencode-background @renjfk/opencode-voice @howaboua/pickle-thinker opencode-rag-plugin opencode-plugin-litellm opencode-autosave-conversation opencode-relay

Write-Host "=== Buoc 2: Clone cac plugin khong tren npm ===" -ForegroundColor Cyan
$tmp = "$env:TEMP\opencode"
New-Item -ItemType Directory -Path $tmp -Force | Out-Null

@{
  "message-bridge-opencode-plugin" = "https://github.com/YuanG1944/message-bridge-opencode-plugin.git"
  "opencode-power-pack" = "https://github.com/waybarrios/opencode-power-pack.git"
  "opencode-context-cache" = "https://github.com/JackDrogon/opencode-context-cache.git"
  "opencode-ralph" = "https://github.com/rot13maxi/opencode-ralph.git"
  "omem" = "https://github.com/ourmem/omem.git"
}.GetEnumerator() | ForEach-Object {
  $dir = "$tmp\$($_.Key)"
  if (-not (Test-Path $dir)) {
    git clone $_.Value $dir 2>$null
    Write-Host "  Cloned $($_.Key)" -ForegroundColor Green
  } else {
    Write-Host "  $($_.Key) da co san" -ForegroundColor Yellow
  }
}

Write-Host "=== Buoc 3: Cai dat 200 skills ===" -ForegroundColor Cyan

$swarm = "brainstorm","clarify","clarify-spec","codebase-review-swarm","commit-pr","consult","council","critic-gate","deep-dive","deep-research","design-docs","discover","engineering-conventions","execute","fork-pr-operations","gate-attribution","issue-ingest","issue-tracer","loop","merge-queue-readiness","parallel-work-check","phase-wrap","plan","pre-phase-briefing","resume","running-tests","specify","swarm","swarm-ci-monitor","swarm-implement","swarm-pr-feedback","swarm-pr-review","swarm-pr-subscribe","test-file-split","worktree-retry-cleanup","writing-tests","ci-failure-batching","ci-fix-monitor","skill-edit-validation"

$anthropic = "algorithmic-art","brand-guidelines","canvas-design","claude-api","doc-coauthoring","docx","frontend-design","internal-comms","mcp-builder","pdf","pptx","slack-gif-creator","template-skill","theme-factory","web-artifacts-builder","webapp-testing","xlsx"

$vercel = "deploy-to-vercel","vercel-cli-with-tokens","vercel-optimize","vercel-react-best-practices","vercel-react-native-skills","vercel-react-view-transitions","web-design-guidelines"

$stripe = "connect-recommend","stripe-best-practices","stripe-directory","stripe-docs","stripe-projects","upgrade-stripe"

$netlify = "netlify-access-control","netlify-agent-runner","netlify-ai-gateway","netlify-blobs","netlify-caching","netlify-config","netlify-database","netlify-deploy","netlify-edge-functions","netlify-forms","netlify-frameworks","netlify-functions","netlify-identity","netlify-image-cdn","netlify-mcp-servers"

$supabase = "supabase","supabase-postgres-best-practices"

$angular = "angular-component","angular-di","angular-directives","angular-forms","angular-http","angular-routing","angular-signals","angular-ssr","angular-testing","angular-tooling"

$terraform = "azure-verified-modules","terraform-search-import","terraform-style-guide","terraform-test","refactor-module","terraform-stacks","new-terraform-provider","provider-actions","provider-docs","provider-resources","provider-test-patterns","run-acceptance-tests","terraform-policy","aws-ami-builder","azure-image-builder","windows-builder","push-to-registry"

$opencode = "aspnet-core","bug-fixing","chatgpt-apps","cli-creator","cloudflare-deploy","define-goal","figma","figma-code-connect-components","figma-create-design-system-rules","figma-create-new-file","figma-generate-design","figma-generate-library","figma-implement-design","figma-use","gh-address-comments","gh-fix-ci","hatch-pet","jupyter-notebook","linear","migrate-to-codex","notion-knowledge-capture","notion-meeting-intelligence","notion-research-documentation","notion-spec-to-implementation","openai-docs","playwright","playwright-interactive","render-deploy","screenshot","security-best-practices","security-ownership-map","security-threat-model","sentry","speech","test-driven-development","transcribe"

$others = "browser-automation","plugin-creator","find-skills","create-voltagent","voltagent-best-practices","voltagent-docs-bundle"

foreach ($s in $swarm) { npx skills@latest add opencode-ai/opencode-swarm --skill $s 2>$null }
foreach ($s in $anthropic) { npx skills@latest add anthropic/skills --skill $s 2>$null }
foreach ($s in $vercel) { npx skills@latest add vercel-labs/agent-skills --skill $s 2>$null }
foreach ($s in $stripe) { npx skills@latest add stripe/ai --skill $s 2>$null }
foreach ($s in $netlify) { npx skills@latest add netlify/context-and-tools --skill $s 2>$null }
foreach ($s in $supabase) { npx skills@latest add supabase/agent-skills --skill $s 2>$null }
foreach ($s in $angular) { npx skills@latest add analogjs/angular-skills --skill $s 2>$null }
foreach ($s in $terraform) { npx skills@latest add hashicorp/agent-skills --skill $s 2>$null }
foreach ($s in $opencode) { npx skills@latest add openai/skills --skill $s 2>$null }

npx skills@latest add opencode-ai/opencode-chrome-devtools --skill browser-automation 2>$null
npx skills@latest add opencode-ai/opencode-plugin-creator --skill plugin-creator 2>$null
npx skills@latest add vercel-labs/skills --skill find-skills 2>$null
npx skills@latest add voltagent/skills --skill create-voltagent 2>$null
npx skills@latest add voltagent/skills --skill voltagent-best-practices 2>$null
npx skills@latest add voltagent/skills --skill voltagent-docs-bundle 2>$null
npx skills@latest add anthropic/skills --skill skill-creator 2>$null

# Skills tu opencode-power-pack
Copy-Item "$tmp\opencode-power-pack\skills\*" ".agents\skills\" -Recurse -Force 2>$null
# Skill tu opencode-relay-ashotn
Copy-Item "$tmp\opencode-relay-ashotn\.opencode\skills\*" ".agents\skills\" -Recurse -Force 2>$null

Write-Host "=== Buoc 4: Tao opencode.json ===" -ForegroundColor Cyan
$config = @'
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": [
    "opencode-chrome-devtools@latest",
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
    "opencode-auto-resume",
    "opencode-browser",
    "@zenobius/opencode-background",
    "@renjfk/opencode-voice",
    "@howaboua/pickle-thinker",
    "opencode-rag-plugin",
    "opencode-plugin-litellm",
    "opencode-autosave-conversation",
    "opencode-relay",
    "file:///C:/Users/ACER/AppData/Local/Temp/opencode/message-bridge-opencode-plugin/index.ts",
    "file:///C:/Users/ACER/AppData/Local/Temp/opencode/opencode-power-pack/.opencode/plugins/opencode-power-pack.js",
    "file:///C:/Users/ACER/AppData/Local/Temp/opencode/opencode-context-cache/plugins/opencode-context-cache.mjs",
    "file:///C:/Users/ACER/AppData/Local/Temp/opencode/opencode-ralph/plugin/ralph.ts",
    "file:///C:/Users/ACER/AppData/Local/Temp/opencode/omem/plugins/opencode/src/index.ts"
  ]
}
'@
$config | Out-File -FilePath opencode.json -Encoding utf8

Write-Host "=== DONE! Tong cong: 31 plugins + 200 skills ===" -ForegroundColor Green
Write-Host "Gõ 'opencode' de bat dau su dung" -ForegroundColor Yellow
