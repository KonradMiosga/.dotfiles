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
alias zbr="zig build run"
alias gs="git status"
alias h="history|grep"

# gitlog helper
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

source ~/.config/lf/lfcd.sh
export PATH="/usr/local/sbin:$PATH"
export PATH="/snap/bin/:$PATH"
export CPATH="/usr/local/include/:$CPATH"
