# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable completions
# autoload -Uz compinit && compinit

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# For more plugins check: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(history dirhistory common-aliases sudo git docker docker-compose)

fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"
source $ZSH/oh-my-zsh.sh

# powerlevel10k
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme
# zsh-autocomplete
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zsh-autosuggestions
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# zsh-syntax-highlighting
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# # autoenv
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autoenv/autoenv.plugin.zsh
# # z
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z/zsh-z.plugin.zsh
# # thefuck
# eval $(thefuck --alias)

# Other Plugins to consider:
# https://github.com/jeffreytse/zsh-vi-mode
# https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv
# https://github.com/Aloxaf/fzf-tab

# Source alias list
source $HOME/.aliases.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# As an alternative to power10k
# eval "$(starship init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
