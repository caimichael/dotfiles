# Michael Cai's .bashrc

export EDITOR=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable if your system doesn't have native vim clipboard support
# Because there isn't clipboard support on the vim shipped with RHL
alias vim='gvim -v'
alias v='gvim -v'

# Thanks @micahjsmith & @pearlzli
# User specific aliases
alias ..='\cd ..'
alias ...='\cd ../..'
alias ....='\cd ../../..'
alias e='evince'

# ls displays
alias ls='ls --color'
alias la='ls -a'
alias ld='ls -d */'
alias ll='ls -l -h'

alias ga="git add"
alias gb="git branch"
alias gcm="git commit -m"
alias gch="git checkout"
alias gd="git diff"
alias gdt="git difftool"
alias gg="git grep"
alias gpo="git push origin"
alias gs="git status"

alias tmuxn='tmux new -s'
alias tmuxa='tmux attach -t'
alias tmuxd='tmux detach'
alias tls='tmux list-sessions'

#Chris's nice grep
mygrep() {
    fgrep -nirs $1 . --colour;
}

# When evince and other graphical displays don't work, it's often because the
# DISPLAY environment variable inside tmux isn't the same as the one outside
# tmux.
# 
# 1. Detach from tmux session and use cache_display
# 2. Reattach to tmux session and use parse_display. (You'll have to do this in
#    each pane in which you want to open a graphical display.)
cache_display() {
    echo "$DISPLAY" > ~/.DISPLAY
    echo "DISPLAY cached as $DISPLAY"
}

parse_display() {
    DISPLAY_OLD="$DISPLAY"
    export DISPLAY="$(cat ~/.DISPLAY)"
    echo "DISPLAY updated from $DISPLAY_OLD to $DISPLAY"
}

# Stop graphical display popup for password when git pushing
unset SSH_ASKPASS

# User specific aliases and functions
source ~/.aliases
