# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc
source ~/.config/task/.task_env

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

alias ll='ls -a'
alias vim='nvim'
alias lg='lazygit'
alias mux='tmuxinator'

alias nvim-new='NVIM_APPNAME=nvim-new nvim'

export PATH=~/.dotfiles/scripts/:$PATH

bind '"\C-f":"tmux-sessionizer\n"'

# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
# export PATH="$JAVA_HOME/bin:$PATH"

# . "/home/copperplate/.local/share/bob/env/env.sh"
. "/home/copperplate/.local/share/bob/env/env.sh"

# Task- and Timewarrior stuff
alias in='task add +in'

if [[ -z "$TMUX" && $- == *i* ]]; then
    tmuxinator start poke
fi

tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle

webpage_title() {
  url="$1"
  title=$(
    wget -qO- "$url" \
      | hxnormalize -x 2>/dev/null \
      | hxselect -s '\n' -c 'title' 2>/dev/null \
      | head -n1 \
      | tr '\n' ' ' \
      | sed 's/^[[:space:]]*//;s/[[:space:]]*$//;s/[[:space:]]\+/ /g' \
      | python3 -c 'import sys, html; print(html.unescape(sys.stdin.read().strip()))'
  )
  # fallback to empty (caller can use url if desired)
  printf '%s' "$title"
}


read_and_review (){
    link="$1"
    title=$(webpage_title $link)
    echo $title
    descr="\"Read and review: $title\""
    id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

alias rnr=read_and_review

alias rnd='task add +rnd +next'

check_projects_without_next_action() {
    # call your script that lists projects missing next actions
    local projects
    projects=$(projects_without_next_action)

    if [ -n "$projects" ]; then
        # -e enables interpreting \n
        printf "\e[31mAttention: The following projects don't currently have a next action:\e[0m\n"
        echo "$projects"
        echo
    fi
}

if [[ $- == *i* ]]; then
    check_projects_without_next_action
fi

