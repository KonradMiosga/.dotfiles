source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
eval "$(starship init zsh)"

# Load and initialise completion system
# autoload -Uz compinit
# compinit

# source ~/.zprofile
alias vim="nvim"
alias cl="clear"
alias tma="tmux a"
alias tkill="pkill 'tmux'"
alias lf="lfcd"
alias ll="ls -lA --color --group-directories-first"
alias lg="lazygit"
alias zbr="zig build run"
alias gs="git status"
alias h="history|grep"

# gitlog helper
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="/home/copperplate/.local/bin:$PATH"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
