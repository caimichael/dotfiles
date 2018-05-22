# Michael Cai's .bashrc

export EDITOR=vim
export TERM=xterm-256color

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases
alias ..='\cd ..'
alias ...='\cd ../..'
alias ....='\cd ../../..'
alias .....='\cd ../../../..'
alias ......='\cd ../../../../..'
alias mv='mv -i'
alias cp='cp -i'

# ls displays
alias ls='ls --color'
alias la='ls -a'
alias ld='ls -d */'
alias ll='ls -l -h'
alias lt='ll --sort=t'
alias lth='ll --sort=t | head'

# Hide files from ls
hide="--hide='*.aux' --hide='*.bbl' --hide='*.blg' --hide='*.fls' --hide='*.log' --hide='*.nav' --hide='*.out' --hide='*.snm' --hide='*.thm' --hide='*.toc' --hide='*~' --hide='*.fdb_latexmk' --hide='*.synctex.gz'"

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
alias gchb="git checkout -b"
alias gd="git diff"
alias gdt="git difftool"
alias gdc="git diff-tree --no-commit-id --name-only -r"
alias gg="git grep"
alias gpo="git push origin"
alias gs="git status"
alias grm="git rm"
alias gu="git reset HEAD"

alias tmuxn='tmux new -s'
alias tmuxa='tmux attach -t'
alias tmuxd='tmux detach'
alias tmuxk='tmux kill-session -t'
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

# Stop graphical display popup for password when git pushing
unset SSH_ASKPASS

# User specific aliases and functions
source ~/.bashrc-local
