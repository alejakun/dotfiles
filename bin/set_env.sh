#!/bin/sh

export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export PATH=$DOTFILES/bin/scripts:$DOTFILES/bin/scripts/utils:$PATH
export HOMEBREW_BREWFILE=$DOTFILES/brew/Brewfile
export MACOS_VERSION=$(sw_vers | grep ProductVersion | grep -o -E -i '([0-9]*[.])?[0-9]+.*')

source "$HOME/.dotfiles/private/authinfo"
source "$DOTFILES/bin/scripts/utils"