#----------------------------------------------------------
# added by Anaconda 2.3.0 installer
export PATH="/Users/michael/anaconda/bin:$PATH"

export PATH="/Applications/Julia-0.4.3.app/Contents/Resources/julia/bin:$PATH" 

alias apy='use_anaconda_python'
alias bpy='reset_path'

#navigation
alias ..='cd ..'
alias ...='cd .. ; cd ..'

#----------------------------------------------------------

### history bash shell useful settings ###

export HISTCONTROL=ignoredups # Ignores dupes in the history

#----------------------------------------------------------
### BEGIN: easy folder bookmarks in the shell ###

# allows you to save bookmarks to folders
#  cd ~/src/git
#  save git
#  cd ~/src/git/killer/rails/awesome/app
#  save awesome_app
# list your bookmarks
#  show
#   git="~/src/git"
#   awesome_app="~/src/git/killer/rails/awesome/app"
# easily cd into the bookmarks from any directory
#  cd git
#  cd awesome_app
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
  fi
#
alias show='cat ~/.dirs'
  save (){
      command sed "/!$/d" ~/.dirs > ~/.dirs1; mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs;
      }
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

#----------------------------------------------------------
#for updating dotfile folder
alias updot='cp ~/.bashrc ~/dotfiles; cp ~/.tmux.conf ~/dotfiles; cp ~/.vimrc ~/dotfiles'

#----------------------------------------------------------
#tmux aliases
alias tfoobar='tmux attach -t foobar||tmux new -s foobar'
alias tmuxn='tmux new -s'
alias tmuxa='tmux attach -t'
alias tmuxd='tmux detach'
alias tls='tmux list-sessions'

#Chris's nice grep
function mygrep { fgrep -nirs $1 . --colour; } 

