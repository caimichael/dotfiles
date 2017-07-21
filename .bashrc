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
alias mv='mv -i'
alias cp='cp -i'

# ls displays
alias ls='ls --color'
alias la='ls -a'
alias ld='ls -d */'
alias ll='ls -l -h'

# Hide files from ls
hide="--hide='*.aux' --hide='*.bbl' --hide='*.blg' --hide='*.fls' --hide='*.log' --hide='*.nav' --hide='*.out' --hide='*.snm' --hide='*.thm' --hide='*.toc' --hide='*~' --hide='*.fdb_latexmk'"

# OS-specific command aliases
case $OSTYPE in
  cygwin*)
    alias ls="ls --color=auto --sort=extension --group-directories-first $hide"
    ;;
  darwin*) # OS X
    alias ls="ls -G"
    ;;
  linux*)
    alias ls="ls --color=auto --sort=extension --group-directories-first $hide"
    ;;
  *) ;;
esac

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

# Custom bash prompt
#   user@hostname current-directory (git branch) $
# See:
# 1. https://www.linux.com/learn/how-make-fancy-and-useful-bash-prompt-linux
# 2. https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[1;32m\]\u@\h \[\e[0;32m\]\w\[\e[0;36m\]\$(parse_git_branch)\[\e[0;34m\] $ \[\e[m\]"

#Chris's nice grep
mygrep() {
    fgrep -nirs $1 . --colour;
}

# Set default file-creation mode to u=rwx, g=rwx, o=rx
# Check your (human-readable) permissions using "umask -S"
umask 0002

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
source ~/.bashrc-local
