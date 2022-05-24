#!/bin/sh

echo "🖥  Setting up your System..."

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then

    echo "🍺 Installing Homebrew"

    # Install Homebrew for each OS type
    os_type=$(uname)
    if  [ "$os_type" = "Darwin" ]; 
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif [ "$os_type" = "Linux" ];
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    else
        echo "${os_type} is not supported" >&2
        exit 1
    fi 
else
    echo "🍺  Looks like Homebrew is already installed!"
fi

if test "$(uname)" = "Darwin";
  then

    echo " Setting up an Apple System"

    # Install macOS Apps & Packages
    source $DOTFILES/osx/script/brew_install
    source $DOTFILES/osx/script/mackup_restore
    source $DOTFILES/script/setup_xtras

    chsh -s /usr/local/bin/zsh

    # Set macOS preferences - we will run this last because this will reload the shell
    source ./osx/osx_preferences
  else

    echo "🐧 Setting up a Linux System" 

    # Make ZSH the default shell environment
    source ./setup_xtras
    chsh -s $(which zsh) # This is not required in Mac since Catalina
    exit 0
fi

echo "🖥  Setup Finished"