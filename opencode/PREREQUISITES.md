# 前置依赖安装指南

opencode 的部分功能需要以下运行时依赖。

---

## uv / uvx

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

## Node.js / npm

用于安装 Plannotator 插件的 npm 依赖（`@plannotator/opencode`）。

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

安装完成后，在 `~/.config/opencode/` 目录下执行 `npm install` 安装插件依赖。
