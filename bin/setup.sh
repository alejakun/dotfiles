#!/bin/sh

source ./set_env.sh

echo "🖥  Setting up your System..."

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

keep_alive_sudo

if test "$(uname)" = "Darwin";
then

    # MacOS

    echo "🍎 Setting up Apple System"

    # Install macOS Apps & Packages
    # source ./scripts/brew_install

    source ./scripts/setup_zsh
    chsh -s /usr/local/bin/zsh  # This is not required in Mac since Catalina

    source ./scripts/setup_git

    source ./scripts/setup_system_files
    source ./scripts/setup_tmux
    source ./scripts/setup_vim
    source ./scripts/setup_terminal
    # source ./scripts/setup_karabiner

    # Set macOS preferences - we will run this last because this will reload the shell
    # and reboot the sytem
    source ./scripts/setup_system_settings

else
    # Other
    echo "🚫  $(uname) is not supported" >&2
    exit 1
fi

echo "🖥  Setup Finished"
exit 0