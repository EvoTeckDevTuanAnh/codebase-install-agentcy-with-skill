# AI Agency Simulator — Full Setup Guide

> Tổng hợp đầy đủ cài đặt codebase, OpenCode plugins, và skills.
> Sau khi cài OpenCode xong, copy toàn bộ file này và thả vào OpenCode để tự động cài mọi thứ.

---

## 1. Cài Code Base (pnpm monorepo)

### Yêu cầu
- Node.js >= 18
- pnpm >= 9 (cài: `npm install -g pnpm`)

### Clone & Install

```bash
git clone https://github.com/EvoTeckDevTuanAnh/ai-agency-simulator.git
cd ai-agency-simulator
pnpm install
pnpm build
```

### Cấu trúc monorepo
```
apps/
  web-dashboard/       # React + Vite + Three.js frontend
  api-gateway/         # NestJS API Gateway
  auth-service/        # NestJS Auth Service
  agent-service/       # NestJS Agent Service
packages/
  contracts/           # Shared DTOs/types/enums
  config/              # Shared config
  logger/              # Shared logger
  validation/          # Shared validation
infrastructure/        # Docker, deployment
docs/                  # Documentation
```

---

## 2. OpenCode Plugins (11 plugins)

> Sau khi cài OpenCode, tạo file `opencode.json` với nội dung:

```json
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
    "file:///path/to/message-bridge-opencode-plugin/index.ts"
  ]
}
```

Hoặc chạy câu lệnh sau (copy & paste vào terminal sau khi cd vào project):

```bash
# ===== CAI DAT 11 PLUGIN =====
pnpm add -w opencode-chrome-devtools@latest
pnpm add -w opencode-pty
pnpm add -w @prevalentware/opencode-goal-plugin
pnpm add -w opencode-swarm
pnpm add -w @zenobius/opencode-skillful
pnpm add -w opencode-goal-plugin
pnpm add -w opencode-kiro-auth
pnpm add -w @hueyexe/opencode-ensemble@0.16.0
pnpm add -w @morphllm/opencode-morph-plugin
pnpm add -w opencode-gemini-auth

# Plugin message-bridge (khong co tren npm, can clone)
git clone https://github.com/YuanG1944/message-bridge-opencode-plugin.git
# Sau do cai bun: npm install -g bun
# cd message-bridge-opencode-plugin && bun install
```

### Chi tiết từng plugin

| # | Plugin | Mô tả | Ghi chú |
|---|--------|-------|---------|
| 1 | `opencode-chrome-devtools` | Tương tác với Chrome DevTools (DOM, console, network) | Kèm skill `browser-automation` |
| 2 | `opencode-pty` | Hỗ trợ Terminal ảo cho OpenCode | Không kèm skill |
| 3 | `@prevalentware/opencode-goal-plugin` | Quản lý mục tiêu (goal) cho agent | Không kèm skill |
| 4 | `opencode-swarm` | Multi-agent orchestration, 39 skills đi kèm | Kèm 39 skills |
| 5 | `@zenobius/opencode-skillful` | Skill management plugin | Archived, không kèm skill |
| 6 | `opencode-goal-plugin` | Session-scoped `/goal` workflow | Auto-continue, evidence-gated |
| 7 | `opencode-kiro-auth` | Auth với Kiro Desktop (AWS CodeWhisperer) | Claude + Gemini qua Kiro |
| 8 | `@hueyexe/opencode-ensemble` | Parallel AI agents team | Cần Node >= 24 |
| 9 | `@morphllm/opencode-morph-plugin` | Fast Apply, WarpGrep, codebase search | Cần `MORPH_API_KEY` |
| 10 | `opencode-gemini-auth` | Google OAuth -> Gemini models | Dùng Gemini trong OpenCode |
| 11 | `message-bridge-opencode-plugin` | Message bridge (Feishu, Telegram, QQ) | Cần bun, clone local |

---

## 3. Skills (200 global + 40 project-local)

### Copy-paste commands để cài tất cả skills:

```bash
# ===== 1. Swarm skills (39 skills tu opencode-swarm) =====
npx skills@latest add opencode-ai/opencode-swarm --skill brainstorm 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill clarify 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill clarify-spec 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill codebase-review-swarm 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill commit-pr 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill consult 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill council 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill critic-gate 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill deep-dive 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill deep-research 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill design-docs 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill discover 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill engineering-conventions 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill execute 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill fork-pr-operations 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill gate-attribution 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill issue-ingest 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill issue-tracer 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill loop 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill merge-queue-readiness 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill parallel-work-check 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill phase-wrap 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill plan 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill pre-phase-briefing 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill resume 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill running-tests 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill specify 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill swarm 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill swarm-ci-monitor 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill swarm-implement 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill swarm-pr-feedback 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill swarm-pr-review 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill swarm-pr-subscribe 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill test-file-split 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill worktree-retry-cleanup 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill writing-tests 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill ci-failure-batching 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill ci-fix-monitor 2>/dev/null
npx skills@latest add opencode-ai/opencode-swarm --skill skill-edit-validation 2>/dev/null

# ===== 2. Browser automation skill =====
npx skills@latest add opencode-ai/opencode-chrome-devtools --skill browser-automation 2>/dev/null

# ===== 3. Anthropic official skills =====
npx skills@latest add anthropic/skills --skill algorithmic-art 2>/dev/null
npx skills@latest add anthropic/skills --skill brand-guidelines 2>/dev/null
npx skills@latest add anthropic/skills --skill canvas-design 2>/dev/null
npx skills@latest add anthropic/skills --skill claude-api 2>/dev/null
npx skills@latest add anthropic/skills --skill doc-coauthoring 2>/dev/null
npx skills@latest add anthropic/skills --skill docx 2>/dev/null
npx skills@latest add anthropic/skills --skill frontend-design 2>/dev/null
npx skills@latest add anthropic/skills --skill internal-comms 2>/dev/null
npx skills@latest add anthropic/skills --skill mcp-builder 2>/dev/null
npx skills@latest add anthropic/skills --skill pdf 2>/dev/null
npx skills@latest add anthropic/skills --skill pptx 2>/dev/null
npx skills@latest add anthropic/skills --skill skill-creator 2>/dev/null
npx skills@latest add anthropic/skills --skill slack-gif-creator 2>/dev/null
npx skills@latest add anthropic/skills --skill template-skill 2>/dev/null
npx skills@latest add anthropic/skills --skill theme-factory 2>/dev/null
npx skills@latest add anthropic/skills --skill web-artifacts-builder 2>/dev/null
npx skills@latest add anthropic/skills --skill webapp-testing 2>/dev/null
npx skills@latest add anthropic/skills --skill xlsx 2>/dev/null

# ===== 4. Vercel skills =====
npx skills@latest add vercel-labs/agent-skills --skill deploy-to-vercel 2>/dev/null
npx skills@latest add vercel-labs/agent-skills --skill vercel-cli-with-tokens 2>/dev/null
npx skills@latest add vercel-labs/agent-skills --skill vercel-optimize 2>/dev/null
npx skills@latest add vercel-labs/agent-skills --skill vercel-react-best-practices 2>/dev/null
npx skills@latest add vercel-labs/agent-skills --skill vercel-react-native-skills 2>/dev/null
npx skills@latest add vercel-labs/agent-skills --skill vercel-react-view-transitions 2>/dev/null
npx skills@latest add vercel-labs/agent-skills --skill web-design-guidelines 2>/dev/null

# ===== 5. Stripe skills =====
npx skills@latest add stripe/ai --skill connect-recommend 2>/dev/null
npx skills@latest add stripe/ai --skill stripe-best-practices 2>/dev/null
npx skills@latest add stripe/ai --skill stripe-directory 2>/dev/null
npx skills@latest add stripe/ai --skill stripe-docs 2>/dev/null
npx skills@latest add stripe/ai --skill stripe-projects 2>/dev/null
npx skills@latest add stripe/ai --skill upgrade-stripe 2>/dev/null

# ===== 6. Netlify skills =====
npx skills@latest add netlify/context-and-tools --skill netlify-access-control 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-agent-runner 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-ai-gateway 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-blobs 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-caching 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-config 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-database 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-deploy 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-edge-functions 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-forms 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-frameworks 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-functions 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-identity 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-image-cdn 2>/dev/null
npx skills@latest add netlify/context-and-tools --skill netlify-mcp-servers 2>/dev/null

# ===== 7. Supabase skills =====
npx skills@latest add supabase/agent-skills --skill supabase 2>/dev/null
npx skills@latest add supabase/agent-skills --skill supabase-postgres-best-practices 2>/dev/null

# ===== 8. Angular skills =====
npx skills@latest add analogjs/angular-skills --skill angular-component 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-di 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-directives 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-forms 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-http 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-routing 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-signals 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-ssr 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-testing 2>/dev/null
npx skills@latest add analogjs/angular-skills --skill angular-tooling 2>/dev/null

# ===== 9. HashiCorp/Terraform skills =====
npx skills@latest add hashicorp/agent-skills --skill azure-verified-modules 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill terraform-search-import 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill terraform-style-guide 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill terraform-test 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill refactor-module 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill terraform-stacks 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill new-terraform-provider 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill provider-actions 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill provider-docs 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill provider-resources 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill provider-test-patterns 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill run-acceptance-tests 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill terraform-policy 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill aws-ami-builder 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill azure-image-builder 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill windows-builder 2>/dev/null
npx skills@latest add hashicorp/agent-skills --skill push-to-registry 2>/dev/null

# ===== 10. OpenAI curated skills =====
npx skills@latest add openai/skills --skill aspnet-core 2>/dev/null
npx skills@latest add openai/skills --skill bug-fixing 2>/dev/null
npx skills@latest add openai/skills --skill chatgpt-apps 2>/dev/null
npx skills@latest add openai/skills --skill cli-creator 2>/dev/null
npx skills@latest add openai/skills --skill cloudflare-deploy 2>/dev/null
npx skills@latest add openai/skills --skill define-goal 2>/dev/null
npx skills@latest add openai/skills --skill figma 2>/dev/null
npx skills@latest add openai/skills --skill figma-code-connect-components 2>/dev/null
npx skills@latest add openai/skills --skill figma-create-design-system-rules 2>/dev/null
npx skills@latest add openai/skills --skill figma-create-new-file 2>/dev/null
npx skills@latest add openai/skills --skill figma-generate-design 2>/dev/null
npx skills@latest add openai/skills --skill figma-generate-library 2>/dev/null
npx skills@latest add openai/skills --skill figma-implement-design 2>/dev/null
npx skills@latest add openai/skills --skill figma-use 2>/dev/null
npx skills@latest add openai/skills --skill gh-address-comments 2>/dev/null
npx skills@latest add openai/skills --skill gh-fix-ci 2>/dev/null
npx skills@latest add openai/skills --skill hatch-pet 2>/dev/null
npx skills@latest add openai/skills --skill jupyter-notebook 2>/dev/null
npx skills@latest add openai/skills --skill linear 2>/dev/null
npx skills@latest add openai/skills --skill migrate-to-codex 2>/dev/null
npx skills@latest add openai/skills --skill notion-knowledge-capture 2>/dev/null
npx skills@latest add openai/skills --skill notion-meeting-intelligence 2>/dev/null
npx skills@latest add openai/skills --skill notion-research-documentation 2>/dev/null
npx skills@latest add openai/skills --skill notion-spec-to-implementation 2>/dev/null
npx skills@latest add openai/skills --skill openai-docs 2>/dev/null
npx skills@latest add openai/skills --skill playwright 2>/dev/null
npx skills@latest add openai/skills --skill playwright-interactive 2>/dev/null
npx skills@latest add openai/skills --skill render-deploy 2>/dev/null
npx skills@latest add openai/skills --skill screenshot 2>/dev/null
npx skills@latest add openai/skills --skill security-best-practices 2>/dev/null
npx skills@latest add openai/skills --skill security-ownership-map 2>/dev/null
npx skills@latest add openai/skills --skill security-threat-model 2>/dev/null
npx skills@latest add openai/skills --skill sentry 2>/dev/null
npx skills@latest add openai/skills --skill speech 2>/dev/null
npx skills@latest add openai/skills --skill test-driven-development 2>/dev/null
npx skills@latest add openai/skills --skill transcribe 2>/dev/null

# ===== 11. Plugin-creator skill =====
npx skills@latest add opencode-ai/opencode-plugin-creator --skill plugin-creator 2>/dev/null

# ===== 12. Other vendor skills =====
npx skills@latest add vercel-labs/skills --skill find-skills 2>/dev/null
npx skills@latest add voltagent/skills --skill create-voltagent 2>/dev/null
npx skills@latest add voltagent/skills --skill voltagent-best-practices 2>/dev/null
npx skills@latest add voltagent/skills --skill voltagent-docs-bundle 2>/dev/null
```

---

## 4. Danh sách đầy đủ 200 Skills (toàn bộ hệ thống)

> Các skill được phân loại theo source/provider.

### Anthropic Skills (18 skills)
`algorithmic-art`, `brand-guidelines`, `canvas-design`, `claude-api`, `doc-coauthoring`, `docx`, `frontend-design`, `internal-comms`, `mcp-builder`, `pdf`, `pptx`, `skill-creator`, `slack-gif-creator`, `template-skill`, `theme-factory`, `web-artifacts-builder`, `webapp-testing`, `xlsx`

### OpenAI Curated Skills (36 skills)
`aspnet-core`, `bug-fixing`, `chatgpt-apps`, `cli-creator`, `cloudflare-deploy`, `define-goal`, `figma`, `figma-code-connect-components`, `figma-create-design-system-rules`, `figma-create-new-file`, `figma-generate-design`, `figma-generate-library`, `figma-implement-design`, `figma-use`, `gh-address-comments`, `gh-fix-ci`, `hatch-pet`, `jupyter-notebook`, `linear`, `migrate-to-codex`, `netlify-deploy`, `notion-knowledge-capture`, `notion-meeting-intelligence`, `notion-research-documentation`, `notion-spec-to-implementation`, `openai-docs`, `playwright`, `playwright-interactive`, `render-deploy`, `screenshot`, `security-best-practices`, `security-ownership-map`, `security-threat-model`, `sentry`, `speech`, `test-driven-development`, `transcribe`

### Vercel Skills (7 skills)
`deploy-to-vercel`, `vercel-cli-with-tokens`, `vercel-optimize`, `vercel-react-best-practices`, `vercel-react-native-skills`, `vercel-react-view-transitions`, `web-design-guidelines`

### Stripe Skills (6 skills)
`connect-recommend`, `stripe-best-practices`, `stripe-directory`, `stripe-docs`, `stripe-projects`, `upgrade-stripe`

### Netlify Skills (16 skills)
`netlify-access-control`, `netlify-agent-runner`, `netlify-ai-gateway`, `netlify-blobs`, `netlify-caching`, `netlify-config`, `netlify-database`, `netlify-deploy`, `netlify-edge-functions`, `netlify-forms`, `netlify-frameworks`, `netlify-functions`, `netlify-identity`, `netlify-image-cdn`, `netlify-mcp-servers`

### Supabase Skills (2 skills)
`supabase`, `supabase-postgres-best-practices`

### Angular Skills (10 skills)
`angular-component`, `angular-di`, `angular-directives`, `angular-forms`, `angular-http`, `angular-routing`, `angular-signals`, `angular-ssr`, `angular-testing`, `angular-tooling`

### HashiCorp/Terraform Skills (17 skills)
`azure-verified-modules`, `terraform-search-import`, `terraform-style-guide`, `terraform-test`, `refactor-module`, `terraform-stacks`, `new-terraform-provider`, `provider-actions`, `provider-docs`, `provider-resources`, `provider-test-patterns`, `run-acceptance-tests`, `terraform-policy`, `aws-ami-builder`, `azure-image-builder`, `windows-builder`, `push-to-registry`

### OpenCode Swarm Skills (39 skills)
`brainstorm`, `clarify`, `clarify-spec`, `codebase-review-swarm`, `commit-pr`, `consult`, `council`, `critic-gate`, `deep-dive`, `deep-research`, `design-docs`, `discover`, `engineering-conventions`, `execute`, `fork-pr-operations`, `gate-attribution`, `issue-ingest`, `issue-tracer`, `loop`, `merge-queue-readiness`, `parallel-work-check`, `phase-wrap`, `plan`, `pre-phase-briefing`, `resume`, `running-tests`, `specify`, `swarm`, `swarm-ci-monitor`, `swarm-implement`, `swarm-pr-feedback`, `swarm-pr-review`, `swarm-pr-subscribe`, `test-file-split`, `worktree-retry-cleanup`, `writing-tests`, `ci-failure-batching`, `ci-fix-monitor`, `skill-edit-validation`

### Other Skills (5 skills)
`browser-automation` (từ opencode-chrome-devtools), `plugin-creator` (từ opencode-plugin-creator), `find-skills` (từ vercel-labs/skills), `create-voltagent`, `voltagent-best-practices`, `voltagent-docs-bundle` (từ voltagent/skills)

---

## 5. Các Plugin có hướng dẫn / instruction files

### @morphllm/opencode-morph-plugin
Thêm vào `opencode.json`:
```json
{
  "instructions": [
    "node_modules/@morphllm/opencode-morph-plugin/instructions/morph-tools.md"
  ]
}
```
Và set env: `export MORPH_API_KEY="sk-...your-key"`

### opencode-gemini-auth
Cấu hình Google project trong `opencode.json`:
```json
{
  "provider": {
    "google": {
      "options": {
        "projectId": "your-gcp-project-id"
      }
    }
  }
}
```

### @hueyexe/opencode-ensemble
Cần allow worktree paths:
```json
{
  "permission": {
    "external_directory": {
      "~/.local/share/opencode/worktree/**": "allow"
    }
  }
}
```

### opencode-goal-plugin
Cấu hình command:
```json
{
  "command": {
    "goal": {
      "description": "Set a session-scoped goal and auto-continue until complete.",
      "template": "$ARGUMENTS",
      "agent": "build"
    }
  }
}
```

---

## 6. Quick Copy-Paste (cài mọi thứ chỉ với 1 lần copy)

### Bước 1: Cài OpenCode CLI
```bash
npm install -g @opencode-ai/cli
```

### Bước 2: Clone codebase
```bash
git clone https://github.com/EvoTeckDevTuanAnh/ai-agency-simulator.git
cd ai-agency-simulator
pnpm install
```

### Bước 3: Cài plugins
```bash
pnpm add -w opencode-chrome-devtools@latest opencode-pty @prevalentware/opencode-goal-plugin opencode-swarm @zenobius/opencode-skillful opencode-goal-plugin opencode-kiro-auth @hueyexe/opencode-ensemble@0.16.0 @morphllm/opencode-morph-plugin opencode-gemini-auth
```

### Bước 4: Tạo opencode.json
```bash
cat > opencode.json << 'EOF'
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
    "opencode-gemini-auth"
  ]
}
EOF
```

### Bước 5: Copy toàn bộ section 3 ở trên vào OpenCode và thả vào
Sau khi chạy `opencode`, copy paste tất cả các lệnh `npx skills@latest add ...` từ **Section 3** ở trên.

---

## 7. Kiến trúc hệ thống

```
┌─────────────────────────────────────────────────────┐
│                    OpenCode CLI                       │
│  (plugins: 11  |  skills: 200  |  agents: swarm)     │
├─────────────────────────────────────────────────────┤
│                    API Gateway                        │
│                 (NestJS - REST)                       │
├────────────┬──────────────────────┬─────────────────┤
│ Auth       │   Agent Service      │   Dashboard     │
│ Service    │   (NestJS)           │   (React+Vite)  │
│ (NestJS)   │                     │   + Three.js    │
└────────────┴──────────────────────┴─────────────────┘
```

---

*Generated: 2026-07-31*
