# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/atmachine-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# source ~/.zprofile
alias vim="nvim"
alias cl="clear"
alias tma="tmux a"
alias tkill="pkill 'tmux'"
alias lf="lfcd"
alias ll="ls -lA"
alias lg="lazygit"

source ~/.config/lf/lfcd.sh
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/zig-macos-x86_64-0.14.0-dev.184+bf588f67d/
