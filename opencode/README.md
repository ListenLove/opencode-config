# opencode

AI 编码助手 [opencode](https://opencode.ai) 的配置文件集合。

## 包含内容

| 文件 | 说明 |
|------|------|
| `AGENTS.md` | Karpathy 行为规范：先思考再编码、简单优先、外科手术式修改、目标驱动执行 |
| `opencode.json` | 主配置：Plan 模式为默认 Agent，deepseek-v4-pro 用于推理/计划，deepseek-v4-flash 用于执行/探索 |
| `.env.example` | 推荐环境变量：`OPENCODE_ENABLE_EXA=1`（联网搜索）、`OPENCODE_EXPERIMENTAL=true`（实验性功能） |
| `skills/deepmax/` | `/deepmax` 命令加载深度推理技能，用于复杂架构/算法/排错任务 |

## AI 安装 Prompt

> 请将以下 opencode 配置部署到当前系统：

1. 在 `~/.config/opencode/` 目录下创建符号链接，指向本仓库中的 opencode 配置文件：
   - `ln -sf $(pwd)/AGENTS.md ~/.config/opencode/AGENTS.md`
   - `ln -sf $(pwd)/opencode.json ~/.config/opencode/opencode.json`

2. 复制环境变量模板（若尚未配置）：
   - `cp -n .env.example ~/.config/opencode/.env`（如需自定义则手动编辑）

3. 部署 skills 目录：
   - `ln -sf $(pwd)/skills ~/.config/opencode/skills`

4. 确认 opencode.json 中 `skills.paths` 指向正确路径。
