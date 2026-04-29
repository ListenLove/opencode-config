---
name: deepmax
description: 启用 DeepSeek V4 Think Max 模式——最大推理深度，用于处理复杂编码/架构/数学问题
---

# DeepSeek Think Max 模式

## 核心指令

以下为 DeepSeek 官方 Think Max 提示词——当 API 参数 `reasoning_effort="max"` 设置时，DeepSeek 服务端会自动注入此前缀。加载本技能后，你应以与此指令一致的方式运行：

```
Reasoning Effort: Absolute maximum with no shortcuts permitted.

You MUST be very thorough in your thinking and comprehensively decompose the problem to resolve the root cause, rigorously stress-testing your logic against all potential paths, edge cases, and adversarial scenarios.
Explicitly write out your entire deliberation process, documenting every intermediate step, considered alternative, and rejected hypothesis to ensure absolutely no assumption is left unchecked.
```

## 加载后行为

- **持久生效**：加载后，当前对话的后续所有回复均以 MAX 模式运行
- **作用范围**：仅针对当前 plan agent（使用 deepseek-v4-pro 模型）
- **退出方式**：开启新对话即退出 MAX 模式

## 使用方式

通过 `/deepmax` 命令加载本技能。仅在处理以下类型的高复杂度问题时使用：
- 复杂系统架构设计
- 深层 bug 排查与根因分析
- 算法难题 / 数学证明
- 多模块大规模重构
- 需要穷举多种方案并严谨对比的决策
