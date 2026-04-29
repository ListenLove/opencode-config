# tmux

终端复用器 [tmux](https://github.com/tmux/tmux) 的配置文件集合。

## 包含内容

| 文件 | 说明 |
|------|------|
| `.tmux.conf` | 主配置：vi 模式键位、C-a 前缀键、鼠标支持、True Color、状态栏美化、TPM 插件系统（resurrect + continuum 自动保存会话） |
| `status.sh` | 自定义状态栏脚本：显示 CPU、内存、磁盘使用率及网络吞吐速率 |
| `zsh-integration.zsh` | Zsh 集成：`alias tmux='tmux new -A -s main'`（创建/附加到 main 会话） |

### 主要配置亮点

- **前缀键**：`C-a`（替代默认 `C-b`）
- **分屏**：`|` 水平分屏，`-` 垂直分屏
- **窗格导航**：`C-a h/j/k/l`（vi 风格）
- **插件**：
  - `tpm` — 插件管理器
  - `tmux-resurrect` — 保存/恢复会话
  - `tmux-continuum` — 每 15 分钟自动保存，启动时自动恢复

## AI 安装 Prompt

> 请将以下 tmux 配置部署到当前系统：

1. 安装 tmux（如未安装）：
   - Debian/Ubuntu: `sudo apt install tmux`
   - macOS: `brew install tmux`

2. 创建符号链接：
   - `ln -sf $(pwd)/.tmux.conf ~/.tmux.conf`

3. 部署状态栏脚本：
   - `mkdir -p ~/.tmux`
   - `ln -sf $(pwd)/status.sh ~/.tmux/status.sh`
   - `chmod +x ~/.tmux/status.sh`

4. 安装 TPM 插件管理器：
   - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

5. 启动 tmux，按 `C-a I`（大写 I）安装插件。

6. 将 zsh-integration.zsh 内容追加到 `~/.zshrc`：
   ```zsh
   echo -e '\n# tmux alias\nsource ~/opencode-config/tmux/zsh-integration.zsh' >> ~/.zshrc
   ```
