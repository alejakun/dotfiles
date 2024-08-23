# Shortcuts
alias reload="exec ${SHELL} -l"
alias ll="ls -AhlFo --color --group-directories-first"
alias c="clear"

# Directories
alias dot="cd $DOTFILES"
alias alex="cd $HOME_BASE/alex"
alias dock="cd $VOLUME/docker"
alias down="cd $VOLUME/docker/down"
alias infra="cd $VOLUME/docker/infra"
alias player="cd $VOLUME/docker/player"
alias share="cd $VOLUME/docker/shared"
alias util="cd $VOLUME/docker/util"
alias black="cd $VOLUME/docker/blackhole"
alias media="cd $VOLUME/media"
alias lib="cd $VOLUME/media/library"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Get RaspberryPi Software Updates, and update installed sudo apt
alias update='dockpull'

# IP addresses
alias ipx="echo Not availabe in Synology"
alias localip="ip -f inet addr | grep inet | grep bond | awk -F 'inet ' '{print $2}' | awk -F '/' '{print $1}'"
alias ips="ip a | grep inet | awk -F 'inet |inet6 ' '{print \$2}' | awk -F '/' '{print \$1}' | sort"

# Show active network interfaces
alias ifactive="echo Not availabe in Synology"
# Flush Directory Service cache
alias flush="echo Not availabe in Synology"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# SSH
alias log="tee $SSH_LOGS/$CTX-`date +%Y%m%d%H%M`.log"

# Docker
alias dexec="(){docker exec -it $1 /bin/bash;}"
alias dcupdate="docker-compose build --pull && docker-compose pull && docker-compose up -d --remove-orphans && docker image prune -f"

alias dockpull='$VOLUME/docker/shared/scripts/docker/dockpull'
alias dockup='$VOLUME/docker/shared/scripts/docker/dockup'
alias dockdown='$VOLUME/docker/shared/scripts/docker/dockdown'

# Git
# alias gst="git status"
# alias gb="git branch"
# alias gc="git checkout"
# alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
# alias diff="git diff"
# alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
# alias pop="git stash pop"
# alias pull="git pull"
# alias push="git push"
alias resolve="git add . && git commit --no-edit"
# alias stash="git stash -u"
# alias unstage="git restore --staged ."
# alias wip="commit wip"

# Example for alias with parameters from:
# https://stackoverflow.com/a/39395740
# alias example='(){ echo Your arg was $1. ;}'
alias addalias='(){ echo "alias $1" >> $DOTFILES/zsh/aliases.zsh  && source $DOTFILES/zsh/aliases.zsh; }'
