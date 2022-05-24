# Recreating environment with .dotfiles

## Installing Command Line Tools for Mac

It is necessary to have `git` installed in the destination host, in case it is not present in the system, it can be installed as part of the Command Line Tools for Mac. To install CLT for Mac without fully installing Xcode there are two options

* To install with a UI use the following command: `xcode-select --install`, this will prompt the UI Installer

* To install fully with the console, the following commands may be used:

```sh
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
sudo softwareupdate -i -a
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
```

Installing CLT for Mac will install the following utilities (as documented [here](https://mac.install.guide/commandlinetools/4.html)) without installing Xcode:

* clang
* gcc
* git
## Cloning the .dotfiles repository

To clone the .dotfiles repository you can use the following command:

```sh
$ git clone git@github.com:alejakun/dotfiles.git .dotfiles
```

## Setting up the environment
### Create GitHub Token

If you need to create the GitHub Token you can follow [this link](https://github.com/settings/tokens/new?scopes=gist,repo,workflow&description=Homebrew).

### Create Strap.sh GitHub Token

If you don't have one already you should create the Strap.sh GitHub Token [here](https://macos-strap.herokuapp.com/) and following the Authorize Strap on GitHub procedure.

## Exporting the environment variables

To properly configure the environment for the scripts you should set the following environment variables:

```sh
export DOTFILES=$HOME/.dotfiles
# ZSH_CUSTOM=$DOTFILES/zsh

export GIT_USER=<GitHub user>
export GIT_EMAIL=<GitHub user email>

export HOMEBREW_GITHUB_API_TOKEN=<GitHub API Toke>
export HOMEBREW_BREWFILE=<Brewfile Location>

# Strap.sh from https://macos-strap.herokuapp.com/
# export STRAP_GIT_NAME=
export STRAP_GIT_EMAIL='$GIT_EMAIL'
export STRAP_GITHUB_USER='$GIT_USER'
export STRAP_GITHUB_TOKEN=<Strap GitHub Token>
# export CUSTOM_HOMEBREW_TAP=
# export CUSTOM_BREW_COMMAND=
export STRAP_ISSUES_URL='https://github.com/MikeMcQuaid/strap/issues/new'
```
This environment might be added to `.zshenv` or `.bashrc` to automatically load the values with every session start.
# Running the strap.sh script

In the Terminal window run the command located in the following route: `~/.dotfiles/osx/script/strap.sh`.
You can also use the following command to run directly from the repository:

```sh
$ bash -c "$(curl -fsSL raw.github.com/alejakun/dotfiles/master/osx/script/strap.sh)"
```

If environment's setup is correct the script will perform the following actions:

* Basic setup and hardening of OSX
* Install of `Homebrew`
* Clone `.dotfiles` repository for user
* Run `Brewfile`
* Run `~/.dotfiles/script/setup` script, which in turn will:
    * Try to install `zsh`
    * Try to install [Homebrew](https://brew.sh/)
    * Install apps and fonts specified in `Brewfile`
        * [Personal Font Collection](https://github.com/alejakun/homebrew-cask)
    * Restore [Mackup](https://github.com/lra/mackup) configuration
    * Install and configure [OhMyZsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) and Fonts:
        * [Powerline](https://github.com/powerline/fonts)
    * Setup `OSX` System Preferences
## Running the setup script

In case it is necessary you can separatedly run the setup script by getting in the `.dotfiles` directory and runnin the following script:

`~/.dotfiles/script/setup`
