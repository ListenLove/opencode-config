# 前置依赖安装指南

opencode 的部分功能需要以下运行时依赖。

---

## 安装顺序

请严格按以下顺序执行：

```
① 安装前置依赖（uv、Node.js）→ 本指南
② 复制配置文件到 ~/.config/opencode/
③ npm install（在 ~/.config/opencode/ 目录执行）
④ 安装 Plannotator slash 命令
⑤ 配置 Context7 MCP
⑥ 重启 opencode 验证
```

---

## ① uv / uvx

用于运行 MCP markitdown 服务器（将 PDF、DOCX、PPTX 等文档转换为 Markdown）。

### 安装

**Linux / macOS / WSL（官方安装脚本）：**

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**macOS（Homebrew）：**

```bash
brew install uv
```

**Windows（PowerShell）：**

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### 说明

- `uvx` 是 uv 内置的子命令，安装 `uv` 后即可直接使用 `uvx`，无需额外安装。
- 安装完成后，重新打开终端或执行 `source ~/.bashrc` / `source ~/.zshrc` 使命令生效。

### 验证

```bash
uv --version
uvx --version
```

---

## ② Node.js / npm

用于安装 Plannotator 插件和相关 npm 依赖。

### 安装

**Linux / macOS（使用 nvm 推荐）：**

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
nvm install --lts
```

**macOS（Homebrew）：**

```bash
brew install node
```

**Linux（包管理器）：**

```bash
# Ubuntu/Debian
sudo apt install nodejs npm

# Fedora
sudo dnf install nodejs npm
```

**Windows：** 从 [nodejs.org](https://nodejs.org/) 下载 LTS 版本安装。

### 验证

```bash
node --version
npm --version
```

---

## ③ 复制配置 & npm install

```bash
# 先复制所有配置文件
cp opencode.json ~/.config/opencode/
cp AGENTS.md ~/.config/opencode/
cp -r skills ~/.config/opencode/
cp -r command ~/.config/opencode/
cp .env.example ~/.config/opencode/.env

# 再安装依赖（此时 package.json 已就位）
cd ~/.config/opencode
npm install
```

> **注意：** 必须先复制配置再 `npm install`，确保 `package.json` 在目标目录中。

---

## ④ Plannotator slash 命令

**只添加 plugin 配置不够**，还必须运行安装脚本才能获得 `/plannotator-review`、`/plannotator-annotate`、`/plannotator-last` 命令：

```bash
curl -fsSL https://plannotator.ai/install.sh | bash
```

验证：

```bash
plannotator --version
ls ~/.config/opencode/command/plannotator-*.md
```

---

## ⑤ Context7 实时库文档 MCP

获取 1000+ 编程库的最新文档，杜绝 AI 编造 API。运行自动配置命令：

```bash
npx ctx7 setup --opencode
```

此命令会打开浏览器进行 OAuth 登录，自动生成 API key 并写入 `opencode.json`。

如需手动配置，访问 https://context7.com/dashboard 注册获取 API key。

---

## ⑥ 重启验证

重启 opencode，确认启动日志中：
- `Loaded plugin: @plannotator/opencode`
- 所有 MCP 服务器连接成功
- `/plannotator-review` 命令可被识别
