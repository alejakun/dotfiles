## Setting up the environment
## Exporting the environment variables

To properly configure the environment for the scripts you should set the following environment variables:

```sh
# Dotfiles location
export DOTFILES=$HOME/.dotfiles

# GitHub user ID details
export GIT_USER=<GitHub user>
export GIT_EMAIL=<GitHub user email>

# Homebrew variables including token for private assets
export HOMEBREW_GITHUB_API_TOKEN=$DOTFILES/osx
export HOMEBREW_BREWFILE=<Brewfile Location>

# Strap.sh from https://macos-strap.herokuapp.com/
# The variables to setup the hardening script for OSX
# export STRAP_GIT_NAME=
export STRAP_GIT_EMAIL=$GIT_EMAIL
export STRAP_GITHUB_USER=$GIT_USER
export STRAP_GITHUB_TOKEN=<Strap GitHub Token>
# export CUSTOM_HOMEBREW_TAP=
# export CUSTOM_BREW_COMMAND=
export STRAP_ISSUES_URL='https://github.com/MikeMcQuaid/strap/issues/new'
```
This environment might be added to `.zshenv` or `.bashrc` to automatically load the values with every session start.

### Creating a GitHub Token

If you need to create the GitHub Token you can follow [this link](https://github.com/settings/tokens/new?scopes=gist,repo,workflow&description=Homebrew).

### Create Strap.sh GitHub Token

If you don't have one already you should create the Strap.sh GitHub Token [here](https://strap.mikemcquaid.com/) and following the Authorize Strap on GitHub procedure.

# Running the strap.sh script

To run the script directly from the dotfiles repository you can use the following command:
```sh
$ bash -c "$(curl -fsSL raw.github.com/alejakun/dotfiles/master/bin/strap.sh)"
```
If environment's setup is correct the script will perform the following actions:

* Basic developer setup and hardening of OSX

<!-- ## Installing Command Line Tools for Mac

Among other things it is necessary to have `git` installed in the destination host (not necessary if starting from the strap.sh script as the script will perform the installation as part of it's actions), in case it is not present in the system, it can be installed as part of the Command Line Tools for Mac. To install CLT for Mac without fully installing Xcode there are two options:
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
``` -->

* Install of [Homebrew](https://brew.sh/) and basic casks
* Clone user's GitHub dotfiles repository for user into `~/.dotfiles`
* Run `Brewfile` as pointed by `$HOMEBREW_BREWFILE`

# Running the setup.sh script

In case it is necessary you can independently run the setup script by getting into the `.dotfiles` directory and running the following command:
```sh
$ bash ~/.dotfiles/script/setup
```

* Run `~/.dotfiles/script/setup` script, which will:
    * Try to install `zsh`
    * Try to install [Homebrew](https://brew.sh/) (in case strap.sh did not ran)
    * Install apps and fonts specified in `Brewfile`
        * [Personal Font Collection](https://github.com/alejakun/homebrew-cask)
    * Restore [Mackup](https://github.com/lra/mackup) configuration
    * Install and configure [OhMyZsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) and Fonts:
        * [Powerline](https://github.com/powerline/fonts)
    * Setup `OSX` System Preferences

In case it is necessary this operations are performed by independenly configured scripts which can be run as needed:
* `setup_git`: Sets up `git` configuration files
* `setup_karabiner`: Sets up `Karabiner.app` configuration files
* `setup_system_files`: Sets up several system configuration files
* `setup_system_settings`: Sets up several system settings
* `setup_terminal`: Loads `Terminal.app` and `iTerm2.app` themes
* `setup_tmux`: Sets up `tmux`
* `setup_vim`: Sets up `vim` / `SpaceVim`
* `setup_zsh`: Setus up `zsh`

# Backup/Restore Mackup settings

Before it is safe to restore Mackup settings it is necessary to sync Mackup directory from Dropbox. Since this requires Dropbox configuration and the hostname is still not setup it is recommended not to configure Dropbox's backup yet, but after the script is fully run.

To run a backup you can go to `.dotfiles/bin` and execute: `./backup.sh backup`
To restore a backup you can go to `.dotfiles/bin` and execute: `./backup.sh restore`