# dotfiles: An intro

Configuration files for text editing (vim), navigating a unix machine/server (bash), window/pane management (tmux), and version control (git), and setting it all up in an automated way (setup.sh).

## Setup

Starting from scratch on a new machine/server just follow these instructions:

1. If on OSX, make your default terminal [solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized) or grab [iterm2](https://www.iterm2.com) and [solarize](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized) that guy, such that when you set up [vim-solarized](https://github.com/altercation/vim-colors-solarized) your colors are consistent.
Alternatively, for both OSX and Unix to solarized I've created a custom color scheme that I used while working at the NY Fed (see [colors.md](https://github.com/caimichael/dotfiles/blob/master/colors.md)).

2. If necessary, generate an SSH key (`ssh-keygen`) and add the public key (by default the content of the file named `id_rsa.pub`) to [Github](https://github.com/settings/keys).

3. Clone this repo **using the SSH protocol** (i.e. `git clone git@github.com:caimichael/dotfiles.git` as opposed to `git clone https://github.com/caimichael/dotfiles.git`), otherwise you'll have to type in your password to push later.

4. Run `bash setup.sh <the/path/to/your/dotfiles/repo>`. (If necessary, `chmod setup.sh u+x` first to give yourself executable permissions).

## Credits

Thanks to [Pearl Li](https://github.com/pearlzli/dotfiles), a friend and former colleague at the Fed for advising me to set up a more organized dotfiles repo (much of which is borrowed or taken straight from her). You're the best<sup>1</sup>! Also thanks to [Micah Smith](https://github.com/micahjsmith/dotfiles) and [Jason Liu](https://github.com/jxnl/dots) for help early on in the setup of my dotfiles.


<sup>1</sup>Even though you use emacs.
