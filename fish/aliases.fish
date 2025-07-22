# Regular command substitutiones
alias cat="bat -n --color=always"
alias top="btop"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias ll="eza --long --icons --git --all --group-directories-first"
alias ls="ll"
alias l="ll"
alias lt="eza --tree --level=2 --long --icons --git --all --group-directories-last"
alias lts="eza --tree --level=2 --icons --git --all --group-directories-first"
alias tms="tmux new -A -s alex"

# Custom but useful commands
alias c="clear"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias yesir="echo (｀_´)ゞ | pbcopy"
alias rlc="source $HOME/.config/fish/config.fish && tmux source-file $HOME/.config/tmux/tmux.conf"
alias sc='open -a /System/Library/CoreServices/ScreenSaverEngine.app'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Dirs
alias dot="cd $DOTFILES"
alias conf="cd $HOME/.config"
alias lib="cd $HOME/Library"
alias drop="cd $HOME/Dropbox"
alias down="cd $HOME/Downloads"
alias docs="cd $HOME/Documents"
alias dtop="cd $HOME/Desktop"
alias proj="cd $HOME/Projects"
alias proj="cd $HOME/docker"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# AI providers https://github.com/aandrew-me/tgpt
alias turbo="tgpt --provider pollinations --model turbo --img --out ./imagen-turbo.jpg"
alias flux="tgpt --provider pollinations --model flux --img --out ./imagen-flux.jpg" 
alias ds="tgpt --provider deepseek --model deepseek-chat"
alias dsr="tgpt --provider deepseek --model deepseek-reasoner"
alias gemini="tgpt --provider gemini --key $GEMINI_API_KEY"
alias oai="tgpt --provider openai --model gpt-3.5 --w"

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# IP addresses
alias ipx="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
# Flush Directory Service cache
alias flush="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
# Print each PATH entry on a separate line
# alias path='echo -e ${PATH//:/\\n}'

# SSH logs
alias log="mkdir -p $SSH_LOGS && tee $SSH_LOGS/$CTX-`date +%Y%m%d%H%M`.log"

alias temp="sudo powermetrics --samplers smc -i1 -n1 |grep -i 'die temperature'"
