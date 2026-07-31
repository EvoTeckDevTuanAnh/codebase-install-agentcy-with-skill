# Codebase Install Agentcy with Skill

Cài **OpenCode CLI** + **24 plugins** + **210 skills** chỉ với **1 lệnh duy nhất**.

Thích hợp cho: Windows (PowerShell) / macOS / Linux.

---

## ⚡ Cài đặt nhanh (1 lệnh)

### Windows (PowerShell)
```powershell
curl -o install.ps1 https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.ps1
.\install.ps1
```

> Nếu bị chặn ExecutionPolicy:
> ```powershell
> powershell -ExecutionPolicy Bypass -File .\install.ps1
> ```

### macOS / Linux
```bash
curl -o install.sh https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.sh
chmod +x install.sh
./install.sh
```

### Chạy OpenCode
```bash
opencode
```

---

## 📦 Script tự động làm gì?

Script `install.ps1` (Windows) / `install.sh` (macOS/Linux) sẽ:

1. **Kiểm tra Node.js >= 18** và npm
2. **Cài OpenCode CLI** từ npm: `npm install -g opencode-ai@latest`
3. **Tạo thư mục cấu hình** `~/.config/opencode/`
4. **Ghi file `opencode.jsonc`** với **24 plugins** (bản sao cấu hình mẫu trong repo)
5. **Cài 24 plugins** từ npm (`npm install`)
6. **Copy toàn bộ 210 skills** (kèm reference files/scripts/assets) từ thư mục `skills/` trong repo vào `~/.config/opencode/skills/`

---

## 🧩 Danh sách 24 plugins

| # | Plugin | Tác dụng |
|---|--------|----------|
| 1 | `opencode-chrome-devtools` | Điều khiển Chrome (DOM, console, network) |
| 2 | `opencode-pty` | Terminal ảo trong OpenCode |
| 3 | `@prevalentware/opencode-goal-plugin` | Quản lý mục tiêu cho agent |
| 4 | `opencode-swarm` | Multi-agent orchestration (kèm skills) |
| 5 | `@zenobius/opencode-skillful` | Quản lý skills |
| 6 | `opencode-goal-plugin` | Session goal + auto-continue |
| 7 | `opencode-kiro-auth` | Auth với Kiro Desktop |
| 8 | `@hueyexe/opencode-ensemble@0.16.0` | Parallel AI agents team |
| 9 | `@morphllm/opencode-morph-plugin` | Fast code editing + search |
| 10 | `opencode-gemini-auth` | Dùng Gemini models |
| 11 | `opencode-beads` | Plugin beads |
| 12 | `opencode-websearch-cited` | Web search + citations |
| 13 | `spotme` | Plugin spotme |
| 14 | `opencode-sessions` | Quản lý sessions |
| 15 | `@ishaksebsib/opencode-tree` | Codebase tree |
| 16 | `opencode-rules` | Quản lý rules |
| 17 | `opencode-ralph-loop` | Ralph loop |
| 18 | `opencode-browser` | Browser automation |
| 19 | `@zenobius/opencode-background` | Background tasks |
| 20 | `@howaboua/pickle-thinker` | Pickle thinker |
| 21 | `opencode-rag-plugin` | RAG plugin |
| 22 | `opencode-plugin-litellm` | LiteLLM integration |
| 23 | `opencode-autosave-conversation` | Tự động lưu conversation |
| 24 | `opencode-relay` | Plugin relay |

---

## 🧠 210 skills theo chủ đề

- **Angular (10)**: component, di, directives, forms, http, routing, signals, ssr, testing, tooling
- **HashiCorp Terraform/Packer (18)**: aws-ami-builder, azure-image-builder, azure-verified-modules, provider-*, terraform-*, new-terraform-provider, push-to-registry, refactor-module, windows-builder...
- **Netlify (16)**: access-control, ai-gateway, blobs, caching, config, database, deploy, edge-functions, forms, frameworks, functions, identity, image-cdn, mcp-servers, agent-runner...
- **OpenAI/ChatGPT (5)**: openai-docs, chatgpt-apps, migrate-to-codex, plugin-creator, skill-creator
- **Stripe (7)**: connect-recommend, stripe-best-practices, stripe-directory, stripe-docs, stripe-projects, upgrade-stripe...
- **Vercel (9)**: vercel-cli-with-tokens, vercel-deploy, vercel-optimize, vercel-react-best-practices, vercel-react-native-skills, vercel-react-view-transitions...
- **Swarm (11)**: swarm, swarm-ci-monitor, swarm-implement, swarm-pr-feedback, swarm-pr-review, swarm-pr-subscribe...
- **Khác**: claude-api, docx, pptx, xlsx, pdf, figma-*, playwright, supabase, aspnet-core, winui-app, cloudflare-deploy, docker/CI-CD...

Danh sách đầy đủ 210 skills nằm trong thư mục [`skills/`](skills/) của repo này.

---

## 📁 Cấu trúc repo

| File/Thư mục | Mô tả |
|--------------|-------|
| `install.ps1` | Script cài đặt cho Windows (PowerShell) |
| `install.sh` | Script cài đặt cho macOS/Linux |
| `opencode.jsonc` | File cấu hình plugins mẫu |
| `skills/` | 210 skills đóng gói sẵn (copy trực tiếp vào `~/.config/opencode/skills/`) |
| `README.md` | Hướng dẫn này |

---

## ❓ Yêu cầu hệ thống

- **Node.js >= 18** + npm (tải từ https://nodejs.org)
- **Windows**: PowerShell 5.1+ (có sẵn trên Windows 10/11)
- **macOS/Linux**: bash

---

## 🔗 Liên kết

- GitHub: https://github.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill
