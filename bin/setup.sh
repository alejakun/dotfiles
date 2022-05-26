#!/bin/sh

source utils

echo "🖥  Setting up your System..."

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

keep_alive_sudo

if test "$(uname)" = "Darwin";
then

    # MacOS

    echo "🍎 Setting up an Apple System"

    # Install macOS Apps & Packages
    source ./brew_install
    source ./restore_mackup.sh

    source ./setup_zsh
    chsh -s /usr/local/bin/zsh  # This is not required in Mac since Catalina

    source ./setup_git
    source ./setup_ssh
    source ./setup_tmux
    source ./setup_vim
    source ./setup_terminal

    # Set macOS preferences - we will run this last because this will reload the shell
    # and reboot the sytem
    source ./setup_macos
    
elif test "$(uname)" = "Linux";
then
    # Linux

    echo "🐧 Setting up a Linux System" 

    # Make ZSH the default shell environment
    source ./brew_install
    source ./apt_install
    
    source ./setup_zsh
    chsh -s $(which zsh)

    source ./setup_git
    source ./setup_ssh
    source ./setup_tmux
    source ./setup_vim

else
    # Other
    echo "$(uname) is not supported" >&2
    exit 1
fi

echo "🖥  Setup Finished"
exit 0