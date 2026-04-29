# codespace-config
个人系统级配置文件仓库，按工具/用途分目录管理。

## 目录结构

```
codespace-config/
├── opencode/          # AI 编码助手 opencode 配置
├── tmux/              # 终端复用器 tmux 配置
└── ...
```

## 模块概览

### [opencode](./opencode/)

[opencode](https://opencode.ai) AI 编码助手配置，包含行为规范（Karpathy 原则）、模型分配、深度推理技能。

详见 [`opencode/README.md`](./opencode/README.md)

### [tmux](./tmux/)

[tmux](https://github.com/tmux/tmux) 终端复用器配置，包含 vi 风格键位、C-a 前缀键、状态栏美化、TPM 插件系统（自动保存/恢复会话）。

详见 [`tmux/README.md`](./tmux/README.md)

## 设计理念

- **分目录管理**：每个工具/应用的配置独立存放，互不干扰
- **AI 友好部署**：每个子目录的 README 含有 AI Agent 可执行的安装 Prompt，无需手动编写安装脚本
- **配置即文档**：README 即为该模块的完整说明
