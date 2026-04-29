# 自动启动 tmux（被注释，改用 alias 手动启动）
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     exec tmux new -A -s main
# fi
alias tmux='tmux new -A -s main'
