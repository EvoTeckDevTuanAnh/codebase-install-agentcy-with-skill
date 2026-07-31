# Codebase Install Agentcy with Skill

Hướng dẫn cài đặt **AI Agency Simulator** + **31 OpenCode plugins** + **200 skills**.

---

## Cách cài đặt

### Bước 1: Cài Node.js và pnpm

- Node.js >= 18: https://nodejs.org
- pnpm: mở terminal chạy `npm install -g pnpm`

### Bước 2: Clone codebase

```bash
git clone https://github.com/EvoTeckDevTuanAnh/ai-agency-simulator.git
cd ai-agency-simulator
pnpm install
```

### Bước 3: Cài OpenCode plugins + skills (1 lệnh duy nhất)

```powershell
# Windows
curl -o install.ps1 https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.ps1
.\install.ps1
```

```bash
# macOS / Linux
curl -o install.sh https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.sh
chmod +x install.sh
./install.sh
```

File này sẽ tự động:
- Cài 26 OpenCode plugins từ npm + clone 5 plugin không trên npm (tổng 31 plugins)
- Cài 200 skills từ 10 nguồn (Anthropic, OpenAI, Vercel, Stripe, Netlify, Supabase, Angular, HashiCorp, Swarm...)
- Tạo file `opencode.json` với 31 plugins

### Bước 4: Chạy OpenCode

```bash
opencode
```

---

## Cấu trúc repo này

| File | Mô tả |
|------|-------|
| `install.ps1` | Script cài đặt cho Windows (PowerShell) |
| `install.sh` | Script cài đặt cho macOS/Linux |
| `GUIDE.md` | Hướng dẫn chi tiết từng bước |
| `opencode.json` | File cấu hình plugins mẫu |

---

## Các plugins đã cài (tổng 31)

| # | Plugin | Tác dụng | Nguồn |
|---|--------|----------|-------|
| 1 | `opencode-chrome-devtools` | Điều khiển Chrome (DOM, console, network) | npm |
| 2 | `opencode-pty` | Terminal ảo trong OpenCode | npm |
| 3 | `@prevalentware/opencode-goal-plugin` | Quản lý mục tiêu cho agent | npm |
| 4 | `opencode-swarm` | Multi-agent orchestration (kèm 39 skills) | npm |
| 5 | `@zenobius/opencode-skillful` | Skill management | npm |
| 6 | `opencode-goal-plugin` | Session goal + auto-continue | npm |
| 7 | `opencode-kiro-auth` | Auth với Kiro Desktop | npm |
| 8 | `@hueyexe/opencode-ensemble` | Parallel AI agents team | npm |
| 9 | `@morphllm/opencode-morph-plugin` | Fast code editing + search | npm |
| 10 | `opencode-gemini-auth` | Dùng Gemini models | npm |
| 11 | `opencode-beads` | Plugin beads | npm |
| 12 | `opencode-websearch-cited` | Web search + citations | npm |
| 13 | `spotme` | Plugin spotme | npm |
| 14 | `opencode-sessions` | Quản lý sessions | npm |
| 15 | `@ishaksebsib/opencode-tree` | Codebase tree | npm |
| 16 | `opencode-rules` | Quản lý rules | npm |
| 17 | `opencode-ralph-loop` | Ralph loop | npm |
| 18 | `opencode-auto-resume` | Auto resume | npm |
| 19 | `opencode-browser` | Browser automation | npm |
| 20 | `@zenobius/opencode-background` | Background tasks | npm |
| 21 | `@renjfk/opencode-voice` | Voice support | npm |
| 22 | `@howaboua/pickle-thinker` | Pickle thinker | npm |
| 23 | `opencode-rag-plugin` | RAG plugin | npm |
| 24 | `opencode-plugin-litellm` | LiteLLM integration | npm |
| 25 | `opencode-autosave-conversation` | Tự động lưu conversation | npm |
| 26 | `opencode-relay` | Plugin relay | npm |
| 27 | `message-bridge-opencode-plugin` | Kết nối Feishu/Telegram/QQ | Clone |
| 28 | `opencode-power-pack` | Power pack plugin + skills | Clone |
| 29 | `opencode-context-cache` | Context caching | Clone |
| 30 | `opencode-ralph` | Plugin Ralph | Clone |
| 31 | `omem` | Plugin omem | Clone |

---

## 200 skills theo chủ đề

- **Anthropic (18 skills)**: algorithmic-art, claude-api, docx, mcp-builder, pdf, pptx, xlsx...
- **OpenAI curated (36 skills)**: bug-fixing, figma, playwright, tdd, sentry...
- **Vercel (7 skills)**: deploy, react best practices...
- **Stripe (6 skills)**: docs, best practices, connect...
- **Netlify (15 skills)**: functions, edge, identity, database...
- **Supabase (2 skills)**: database, postgres...
- **Angular (10 skills)**: component, di, forms, routing...
- **HashiCorp (17 skills)**: terraform, packer, provider...
- **OpenCode Swarm (39 skills)**: plan, execute, swarm-implement...
- **Khác (6 skills)**: browser-automation, plugin-creator, find-skills, voltagent...

Xem danh sách đầy đủ tại [GUIDE.md](GUIDE.md).

---

## Liên kết

- GitHub: https://github.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill
- Codebase: https://github.com/EvoTeckDevTuanAnh/ai-agency-simulator
