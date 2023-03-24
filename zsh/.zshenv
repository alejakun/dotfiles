# Set environment varialbes that should be available to all apps such as $PATH
# $EDITOR and $PAGER

# Default Editor
export EDITOR=vim

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to private environment
source "$DOTFILES/private/authinfo"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$DOTFILES/zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add Java to $PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$(brew --prefix)/opt/openjdk@8/bin:$PATH"

# Add Python Selenium Drivers to $PATH
export PATH=$PATH:~/Dropbox/En\ Proceso/Personales/Browser\ Automation/projects/wow/drivers
