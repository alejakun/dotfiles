# Set environment varialbes that should be available to all apps such as $PATH
# $EDITOR and $PAGER

# Default Editor
export EDITOR=nvim

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Add Brew GNU, Java and Python to $PATH
fish_add_path --prepend $(brew --prefix coreutils)/libexec/gnubin
fish_add_path --prepend $(brew --prefix)/bin
fish_add_path --prepend $(brew --prefix)/opt/openjdk@8/bin
fish_add_path --prepend $(brew --prefix)/opt/python@3.10/libexec/bin

# Path to private environment
source "$DOTFILES/private/.env"

# If you come from bash you might have to change your $PATH.
fish_add_path --prepend $HOME/bin

# Path to user home base
export HOME_BASE=/Users

# Path to SSH Logs
export SSH_LOGS=$HOME/ssh_logs
export CTX=default

# Add fish keybindings
fish_vi_key_bindings

# FZF default options
set FZF_DEFAULT_OPTS '--tmux 80%'
set FZF_CTRL_T_OPTS "
    --walker-skip .git,node_modules,target,.DS_Store
    --preview 'cat --line-range=:500 {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"
set FZF_CTRL_R_OPTS "
    --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set FZF_ALT_C_OPTS "
    --preview 'eza --tree --level=3 --icons --git --all --color=always --group-directories-first {}'"

set -x FZF_DEFAULT_OPTS "\
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
#--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
