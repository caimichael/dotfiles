#!/usr/bin/env bash

# setup.sh
#   Setup all my config. Downloads vim plugins, bash git prompt, and creates
#   symlinks of relevant dotfiles to home directory
#
# Usage: ./setup.sh path/to/dotfile/repo
#
# Credit: micahjsmith & pearlzli

# Defaults
dotfile_dir=$1
VIMDIR="$HOME/.vim"

################################################################
### User-defined Functions/Settings to be used for Installation
################################################################

# Colors
# https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)

install_vim_bundle_github(){
    bundle_author=$1
    bundle_name=$2

    if [ ! -d "${VIMDIR}/bundle/${bundle_name}" ];
    then
        git clone \
            "https://github.com/${bundle_author}/${bundle_name}.git" \
            "${VIMDIR}/bundle/${bundle_name}"
        vim -u NONE -c "helptags ${VIMDIR}/bundle/${bundle_name}/doc" -c q
        echo "${SCRIPTNAME}: installed ${bundle_name}"
    fi
}

# Length of time before timing out
timeout_length="2s"

# Print result of timeout downloading
# Usage: timeout_result <retcode> <filename>
function timeout_result {
    if [ $1 -eq 124 ]; then
        echo "${red}Killed downloading $2: timed out${normal}"
    else
        echo "${green}Successfully downloaded $2${normal}"
    fi
}

# Create symlinks verbosely
# Usage: try_symlink <file>
try_symlink() {
    if [ -L $1 ]; then
        echo "${red}Did not link $1: symlink already exists${normal}"
    elif [ ! -f $1 ]; then
        ln -s "$dotfile_dir/$1" $1
        echo "${green}Linked $1${normal}"
    else
        echo "${red}Did not link $1: non-symlink file already exists. Merge $1 into $dotfile_dir/$1 first and then delete $1 before retrying${normal}"
    fi

}

#####################################
### 1. Install Mac-specific things
#####################################

case $OSTYPE in
    darwin*) # OS X
        if not_installed brew; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi

        brew install coreutils
        brew install tmux
        brew install wget

        my_timeout=gtimeout
        ;;

    *)
        my_timeout=timeout
        ;;
esac

#####################
### 2. Link dotfiles
#####################

cd $HOME

# Create symlinks
for file in ".bashrc" ".tmux.conf" ".vimrc" ".gitconfig"; do
    try_symlink $file
done

# Create local dotfiles if they don't already exist
for file in ".bashrc-local"; do
    if [ ! -f $file ]; then
        touch $file
        echo "${green}Created $file${normal}"
    fi
done

#################
### 3. Vim setup
#################

# Setup vim-pathogen
if [ ! -f "$VIMDIR/autoload/pathogen.vim" ];
then
    mkdir -p "$VIMDIR/autoload" "$VIMDIR/bundle"
    $download "$VIMDIR/autoload/pathogen.vim" https://tpo.pe/pathogen.vim
    echo "$SCRIPTNAME: installed pathogen.vim"
fi

install_vim_bundle_github   altercation   vim-colors-solarized
install_vim_bundle_github   bling         vim-airline
install_vim_bundle_github   ervandew      supertab
install_vim_bundle_github   haya14busa    incsearch.vim
install_vim_bundle_github   jistr         vim-nerdtree-tabs
install_vim_bundle_github   JuliaLang     julia-vim
install_vim_bundle_github   kien          ctrlp.vim
install_vim_bundle_github   kshenoy       vim-signature
install_vim_bundle_github   lervag        vimtex
install_vim_bundle_github   luochen1990   rainbow
install_vim_bundle_github   plasticboy    vim-markdown
install_vim_bundle_github   terryma       vim-expand-region
install_vim_bundle_github   tpope         vim-fugitive
install_vim_bundle_github   tpope         vim-sensible
install_vim_bundle_github   vim-airline   vim-airline-themes
install_vim_bundle_github   Yggdroot      indentLine
install_vim_bundle_github   scrooloose    nerdtree
install_vim_bundle_github   scrooloose    nerdcommenter
