#!/bin/sh

export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh
export PATH=$DOTFILES/bin/scripts:$DOTFILES/bin/scripts/utils:$PATH

source "$HOME/.dotfiles/private/authinfo"
source "$DOTFILES/bin/scripts/utils"