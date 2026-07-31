# Codebase Install Agentcy with Skill

Hướng dẫn cài đặt **AI Agency Simulator** + **11 OpenCode plugins** + **200 skills**.

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
- Cài 10 OpenCode plugins vào dự án
- Cài 200 skills từ 10 nguồn (Anthropic, OpenAI, Vercel, Stripe, Netlify, Supabase, Angular, HashiCorp, Swarm...)
- Tạo file `opencode.json`

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

## Các plugins đã cài

| # | Plugin | Tác dụng |
|---|--------|----------|
| 1 | `opencode-chrome-devtools` | Điều khiển Chrome (DOM, console, network) |
| 2 | `opencode-pty` | Terminal ảo trong OpenCode |
| 3 | `@prevalentware/opencode-goal-plugin` | Quản lý mục tiêu cho agent |
| 4 | `opencode-swarm` | Multi-agent orchestration (kèm 39 skills) |
| 5 | `@zenobius/opencode-skillful` | Skill management |
| 6 | `opencode-goal-plugin` | Session goal + auto-continue |
| 7 | `opencode-kiro-auth` | Auth với Kiro Desktop |
| 8 | `@hueyexe/opencode-ensemble` | Parallel AI agents team |
| 9 | `@morphllm/opencode-morph-plugin` | Fast code editing + search |
| 10 | `opencode-gemini-auth` | Dùng Gemini models |
| 11 | `message-bridge-opencode-plugin` | Kết nối Feishu/Telegram/QQ (cần clone riêng) |

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
- **Khác (5 skills)**: browser-automation, plugin-creator, voltagent...

Xem danh sách đầy đủ tại [GUIDE.md](GUIDE.md).

---

## Liên kết

- GitHub: https://github.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill
- Codebase: https://github.com/EvoTeckDevTuanAnh/ai-agency-simulator
