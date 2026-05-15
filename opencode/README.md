# opencode

AI 编码助手 [opencode](https://opencode.ai) 的配置文件集合。

## 包含内容

| 文件 | 说明 |
|------|------|
| `AGENTS.md` | Karpathy 行为规范：先思考再编码、简单优先、外科手术式修改、目标驱动执行 |
| `opencode.json` | 主配置：Plan 模式为默认 Agent，deepseek-v4-pro 用于推理/计划，deepseek-v4-flash 用于执行/探索，集成 Plannotator 插件和 MCP markitdown |
| `.env.example` | 推荐环境变量：`OPENCODE_ENABLE_EXA=1`（联网搜索）、`OPENCODE_EXPERIMENTAL=true`（实验性功能） |
| `skills/deepmax/` | `/deepmax` 命令加载深度推理技能，用于复杂架构/算法/排错任务 |
| `skills/markitdown/` | Markitdown MCP 技能，通过 `uvx markitdown-mcp` 将 PDF/DOCX/PPTX 等文档转为 Markdown |
| `package.json` | npm 依赖（Plannotator 插件） |
| `PREREQUISITES.md` | 前置依赖安装指南（uv/uvx、Node.js） |

## 前置依赖

使用前请确保已安装以下依赖：

- **uv / uvx**（用于 MCP markitdown 服务器）→ 详见 [PREREQUISITES.md](./PREREQUISITES.md)
- **Node.js / npm**（用于 Plannotator 插件）→ 详见 [PREREQUISITES.md](./PREREQUISITES.md)

## AI 安装 Prompt

> 请将以下 opencode 配置部署到当前系统：

1. **备份现有配置**：先将 `~/.config/opencode/` 目录备份到 `~/.config/opencode.bak/`，列出备份清单请用户确认。

2. **确认后执行覆盖**：
   - `cp $(pwd)/AGENTS.md ~/.config/opencode/AGENTS.md`
   - `cp $(pwd)/opencode.json ~/.config/opencode/opencode.json`
   - `cp -r $(pwd)/skills ~/.config/opencode/skills`
   - `cp $(pwd)/.env.example ~/.config/opencode/.env`（若尚未配置）

3. **安装 npm 依赖**（Plannotator 插件）：
   - `npm install`（在 `~/.config/opencode/` 目录下执行）

4. 确认 opencode.json 中 `skills.paths` 指向正确路径（部署后需改为绝对路径）。
