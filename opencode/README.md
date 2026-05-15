# opencode

AI 编码助手 [opencode](https://opencode.ai) 的配置文件集合。

## 包含内容

| 文件/目录 | 说明 |
|-----------|------|
| `AGENTS.md` | Karpathy 行为规范 + Context7 使用指南 |
| `opencode.json` | 主配置：6 个 MCP 服务器、6 个插件、Plan 模式默认 Agent |
| `.env.example` | 推荐环境变量（联网搜索、实验性功能） |
| `skills/deepmax/` | `/deepmax` 命令加载深度推理技能 |
| `skills/markitdown/` | Markitdown MCP 技能，文档转 Markdown |
| `command/` | Plannotator 审阅 slash 命令 |
| `package.json` | npm 依赖 |
| `PREREQUISITES.md` | 完整部署指南（含安装顺序） |

## 前置依赖

使用前请确保已安装以下依赖：

- **uv / uvx**（用于 MCP markitdown 服务器）→ 详见 [PREREQUISITES.md](./PREREQUISITES.md)
- **Node.js / npm**（用于插件依赖）→ 详见 [PREREQUISITES.md](./PREREQUISITES.md)

## AI 安装 Prompt

> 请将以下 opencode 配置部署到当前系统：

1. **备份现有配置**：先将 `~/.config/opencode/` 目录备份到 `~/.config/opencode.bak/`，列出备份清单请用户确认。

2. **安装前置依赖**（如尚未安装）：
   - 参考 `PREREQUISITES.md` 安装 **uv/uvx** 和 **Node.js/npm**

3. **复制配置文件**：
   ```bash
   cp $(pwd)/opencode.json ~/.config/opencode/
   cp $(pwd)/AGENTS.md ~/.config/opencode/
   cp -r $(pwd)/skills ~/.config/opencode/
   cp -r $(pwd)/command ~/.config/opencode/
   cp $(pwd)/.env.example ~/.config/opencode/.env
   ```

4. **安装 npm 依赖**（在 `~/.config/opencode/` 目录执行）：
   ```bash
   npm install
   ```

5. **安装 Plannotator 命令**（提供 `/plannotator-review` 等 slash 命令）：
   ```bash
   curl -fsSL https://plannotator.ai/install.sh | bash
   ```

6. **配置 Context7 实时文档**（OAuth 登录获取 API key）：
   ```bash
   npx ctx7 setup --opencode
   ```

7. **重启 opencode** 使所有配置生效。
