# Codebase Install Agentcy with Skill

Cài **OpenCode CLI** + **24 plugins** + **bộ skills luôn mới nhất từ các nhà cung cấp** chỉ với **1 lệnh duy nhất**.

Không đóng gói sẵn skills trong repo — installer tự tải skills mới nhất từ repo chính thức của từng nhà cung cấp tại thời điểm cài đặt. Chạy lại bất kỳ lúc nào để cập nhật.

Thích hợp cho: Windows (PowerShell) / macOS / Linux.

---

## ⚡ Cài đặt nhanh (1 lệnh, không cần tải gì)

### Windows (PowerShell)
```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.ps1 | iex"
```

> Hoặc tải về rồi chạy:
> ```powershell
> curl -o install.ps1 https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.ps1
> .\install.ps1
> ```

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.sh | bash
```

> Hoặc tải về rồi chạy:
> ```bash
> curl -o install.sh https://raw.githubusercontent.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill/main/install.sh
> bash install.sh
> ```

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
4. **Ghi file `opencode.jsonc`** với **24 plugins**
5. **Cài 24 plugins** từ npm (`npm install`)
6. **Tải skills mới nhất** từ **9 repo chính thức** của các nhà cung cấp (`git clone --depth 1`, fallback qua tarball nếu bị giới hạn) rồi copy toàn bộ folder skill (kèm reference files/scripts/assets) vào `~/.config/opencode/skills/`

> Cơ chế "live": mỗi lần chạy script, skills được lấy thẳng từ `main` của repo nguồn — luôn là phiên bản mới nhất, không bao giờ lỗi thời. Nếu một repo tải thất bại (mạng/rate-limit), script cảnh báo và tiếp tục; chạy lại là sẽ lấy đủ.

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

## 🌐 Nguồn skills (9 repo chính thức, luôn cập nhật)

| # | Nguồn | Skills nổi bật |
|---|-------|----------------|
| 1 | `anthropics/skills` | brand-guidelines, canvas-design, docx, pdf, pptx, xlsx, pdf, screenshot, slack-gif-creator... |
| 2 | `openai/skills` | chatgpt-apps, openai-docs, migrate-to-codex, plugin-creator, skill-creator... |
| 3 | `vercel-labs/agent-skills` | vercel-deploy, vercel-optimize, vercel-react-best-practices, web-artifacts-builder... |
| 4 | `hashicorp/agent-skills` | terraform-style-guide, terraform-test, provider-*, azure-verified-modules... |
| 5 | `supabase/agent-skills` | supabase, supabase-postgres-best-practices... |
| 6 | `netlify/context-and-tools` | netlify-ai-gateway, netlify-deploy, netlify-functions, netlify-blobs, netlify-identity... |
| 7 | `stripe/ai` | stripe-best-practices, stripe-docs, stripe-projects, connect-recommend... |
| 8 | `angular/skills` | angular-developer, angular-new-app |
| 9 | `VoltAgent/skills` | create-voltagent, voltagent-best-practices, voltagent-docs-bundle |

Cộng thêm skills từ `opencode-swarm` (swarm, feature-dev, code-review...) — tổng khoảng **170+ skills**.

---

## 📁 Cấu trúc repo

| File/Thư mục | Mô tả |
|--------------|-------|
| `install.ps1` | Script cài đặt cho Windows (PowerShell) |
| `install.sh` | Script cài đặt cho macOS/Linux |
| `opencode.jsonc` | File cấu hình plugins mẫu |
| `README.md` | Hướng dẫn này |

> Không còn đóng gói `skills/` trong repo — skills được tải trực tiếp từ nguồn chính thức tại lúc cài.

---

## ❓ Yêu cầu hệ thống

- **Node.js >= 18** + npm (tải từ https://nodejs.org)
- **git** (khuyến nghị; nếu không có, script tự fallback tải tarball — cần `curl` trên macOS/Linux hoặc sẵn có trên Windows)
- **Windows**: PowerShell 5.1+ (có sẵn trên Windows 10/11)
- **macOS/Linux**: bash + `curl` + `tar`

---

## 🔗 Liên kết

- GitHub: https://github.com/EvoTeckDevTuanAnh/codebase-install-agentcy-with-skill
