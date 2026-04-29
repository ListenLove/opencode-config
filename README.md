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

### `skills/deepmax/` — 深度推理技能

通过 `/deepmax` 命令加载，启用 DeepSeek V4 Think Max 模式，显著提升复杂问题的推理质量：

- **最大推理深度**：穷举分析所有可能路径，主动探索多种方案并自我纠错
- **按需启用**：适用于复杂架构设计、深层 bug 排查、算法难题等场景
- **会话级生效**：加载后仅影响当前对话，新对话自动退出

### `.env.example` — 环境变量推荐

| 变量 | 作用 |
|------|------|
| `OPENCODE_ENABLE_EXA=1` | 启用 Exa 联网搜索（websearch + codesearch） |
| `OPENCODE_EXPERIMENTAL=true` | 启用实验性功能（如 question 多选选项） |

设置方式：

```bash
# 添加到 ~/.zshrc 或 ~/.bashrc
export OPENCODE_ENABLE_EXA=1
export OPENCODE_EXPERIMENTAL=true
```

---

## 安装

### 1. 安装配置文件

复制下面这句话，发给你的 AI 编码助手就行：

```txt
帮我安装 ListenLove/opencode-config 这套 opencode 配置到本地。
```

AI 会自动从 GitHub 拉取文件并写入到 `~/.config/opencode/`。

### 2. 设置环境变量（可选，推荐）

将以下内容添加到 `~/.zshrc` 或 `~/.bashrc`：

```bash
export OPENCODE_ENABLE_EXA=1
export OPENCODE_EXPERIMENTAL=true
```

然后执行 `source ~/.zshrc` 使其生效。
