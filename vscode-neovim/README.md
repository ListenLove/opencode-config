# vscode-neovim

Neovim 双模式配置：同一套 `~/.config/nvim` 根据运行环境自动切换。

- **VSCode 模式**（通过 [vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) 插件）→ 精简配置，仅增强键位
- **原生终端模式** → 加载完整 [LazyVim](https://www.lazyvim.org/) 框架

## 外部仓库

| 项目 | 地址 |
|------|------|
| 配置仓库 | https://github.com/ListenLove/vsc-neovim-config |
| 许可证 | MIT |

两个仓库分别独立维护，本目录仅提供引用和 AI 安装指引。

## 架构说明

入口文件 `init.lua` 检测 `vim.g.vscode` 标志决定加载路径：

```
init.lua ──┤
            ├── VSCode 环境 → init_vscode.lua（精简模式，仅加载 plugins.common）
            └── 原生终端   → init_native.lua → lua/config/lazy.lua → LazyVim + lua/plugins/*.lua
```

## 包含内容（外部仓库文件清单）

| 文件 | 说明 |
|------|------|
| `init.lua` | 双模式分发器，检测 VSCode 环境自动切换 |
| `init_vscode.lua` | VSCode 模式配置（173 行）：选项 + 键位映射，仅加载公共插件 |
| `init_native.lua` | 原生 Neovim 入口，引导 LazyVim |
| `lua/config/lazy.lua` | LazyVim 启动引导 + 插件管理 |
| `lua/config/options.lua` | 全局选项（tabstop=2、scrolloff=999、行号、剪贴板等） |
| `lua/config/keymaps.lua` | 自定义键位映射（窗口导航、行首尾跳转、搜索居中、buffer 切换等） |
| `lua/config/autocmds.lua` | 自动命令（恢复上次编辑位置） |
| `lua/plugins/common.lua` | 公共插件（VSCode + 原生共享）：nvim-surround、Comment.nvim、vim-repeat、flash.nvim |
| `lua/plugins/colorscheme.lua` | 主题配置：Monokai Pro（主用）+ TokyoNight（fallback） |
| `lua/plugins/coding.lua` | 代码增强：autopairs、gitsigns、todo-comments、indent-blankline、nvim-ufo 折叠、colorizer、vim-matchup |
| `lua/plugins/editor.lua` | 编辑器增强：conform.nvim 自动格式化、toggleterm.nvim 终端、telescope.nvim 搜索 |
| `lua/plugins/lsp.lua` | LSP：Mason 自动安装 lua/json/yaml/bash/docker/pyright LSP 服务器 |
| `lua/plugins/ui.lua` | 界面：which-key 快捷键提示、LSP 诊断视觉效果 |
| `lua/plugins/disabled.lua` | 禁用 LazyVim 默认插件（关闭 treesitter、DAP、neotest 等） |
| `lua/core/` | 旧版配置备份（未被引用） |
| `lazy-lock.json` | Lazy.nvim 插件锁定文件（44 个插件） |
| `.wezterm.lua` | WezTerm 终端配置（Tokyo Night + JetBrains Mono，同仓库附带） |

## 主要配置亮点

- **双模式分发**：同一目录自动适配 VSCode 和原生终端
- **Monokai Pro 主题**：主用主题，函数/关键字加粗，注释斜体
- **不使用 Treesitter**：禁用 nvim-treesitter，回退 Neovim 内置语法高亮
- **光标始终居中**：`scrolloff=999`
- **Tab 宽度**：默认 2 空格，Python 4 空格
- **LSP 支持**：lua/json/yaml/bash/docker/pyright，保存时自动格式化
- **公共共享插件**：surround/comment/flash/repeat 在 VSCode 和原生模式均可用
- VSCode 内快捷键建议：`Cmd+Shift+H` 前一个标签，`Cmd+Shift+L` 后一个标签

## 前置依赖

- **Neovim >= 0.9**（[下载](https://github.com/neovim/neovim/releases) 或 `brew install neovim`）
- **Visual Studio Code** + **vscode-neovim 插件**（`asvetliakov.vscode-neovim`，可选，仅 VSCode 模式需要）

## AI 安装 Prompt

> 请将以下 VSCode + Neovim 配置部署到当前系统：

1. **安装 Neovim**（如未安装）：
   - macOS: `brew install neovim`
   - Linux: 参考 Neovim 官方 [Install Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)
   - Windows: `winget install Neovim.Neovim`

2. **备份并克隆配置**：
   ```bash
   # 备份现有配置
   mv ~/.config/nvim ~/.config/nvim.bak
   # 克隆配置
   git clone https://github.com/ListenLove/vsc-neovim-config.git ~/.config/nvim
   ```

3. **首次启动 Neovim**（Lazy.nvim 会自动安装所有插件）：
   ```bash
   nvim --headless "+Lazy! sync" +qa
   ```

4. **（可选）配置 VSCode 集成**：
   - 安装 VS Code 插件 `asvetliakov.vscode-neovim`
   - 在 VSCode 设置中启用 `"vscode-neovim.neovimInitVimPaths.linux"` 或对应平台的 Neovim init 路径
   - （可选）在 `keybindings.json` 中添加标签切换快捷键：
     ```json
     { "key": "cmd+shift+h", "command": "workbench.action.previousEditor" },
     { "key": "cmd+shift+l", "command": "workbench.action.nextEditor" }
     ```

5. **（可选）部署 WezTerm 配置**（仓库附带 `.wezterm.lua`）：
   - `ln -sf ~/.config/nvim/.wezterm.lua ~/.wezterm.lua`
