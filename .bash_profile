
#----------------------------------------------------------
# added by Anaconda 2.3.0 installer
export PATH="/Users/michael/anaconda/bin:$PATH"

export PATH="/Applications/Julia-0.4.3.app/Contents/Resources/julia/bin:$PATH" 

alias apy='use_anaconda_python'
alias bpy='reset_path'
#----------------------------------------------------------
# These two require identify be installed, part of ImageMagick. Install the imagemagick package for your system first. 
# # Pass the filename of an image and the first will provide a range of information while the second will just provide the resolution: 
alias imginfo="identify -format '-- %f -- \nType: %m\nSize: %b bytes\nResolution: %wpx x %hpx\nColors: %k'"
alias imgres="identify -format '%f: %wpx x %hpx\n'"

alias ll='ls -Ghlas'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias g='grep -i'  #case insensitive grep
alias f='find . -iname'
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
alias updot='cp ~/.bash_profile ~/dotfiles; cp ~/.tmux.conf ~/dotfiles; cp ~/.vimrc ~/dotfiles'

#----------------------------------------------------------
#tmux aliases
alias tfoobar='tmux attach -t foobar||tmux new -s foobar'
alias tls='tmux list-sessions'
