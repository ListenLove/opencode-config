# opencode-config

一套精心调校的 [opencode](https://opencode.ai) 配置，让 AI 编码更谨慎、更聚焦。

---

## 包含内容

### `AGENTS.md` — 行为规范

- **语言设定**：AI 推理过程全程使用中文
- **Karpathy 行为规范**（4 条核心原则）：
  1. 先思考再编码 — 不假设、不隐藏困惑、主动呈现权衡
  2. 简单优先 — 最少代码解决问题，不写推测性代码
  3. 外科手术式修改 — 只触碰必要内容
  4. 目标驱动执行 — 定义成功标准，循环验证

### `opencode.json` — 模型与 Agent 配置

- **Plan 模式为默认 Agent** — AI 先出计划，等你确认后才执行
- **模型分配**：
  - `deepseek-v4-pro` → 推理与计划（Plan 模式）
  - `deepseek-v4-flash` → 执行、探索、通用任务（Build / Explore / General）
- **安全权限**：Plan 模式下默认只能编辑 `.plan/` 目录

---

## 安装

复制下面这句话，发给你的 AI 编码助手就行：
```txt
帮我安装 ListenLove/opencode-config 这套 opencode 配置到本地。
```

AI 会自动去 GitHub 拉取文件并写入到 `~/.config/opencode/`，覆盖已有配置。
