. ~/.config/fish/env.fish
. ~/.config/fish/aliases.fish

if status is-interactive
    # and not set -q TMUX
    #     tmux new-session -A main
    # Commands to run in interactive sessions can go here
end

function bang_bang; echo $history[1]; end 
abbr -a !! --position anywhere --function bang_bang

# function bind_bang
#     switch  
#         case "!"
#             commandline -t -- $history[1]
#             commandline -f repaint
#         case "*"
#             commandline -i !
#     end
# end

# function bind_dollar
#     switch (commandline -t)[-1]
#         case "!"
#             commandline -f backward-delete-char history-token-search-backward
#         case "*"
#             commandline -i '$'
#     end
# end

# function fish_user_key_bindings
#     bind ! bind_bang
#     bind '$' bind_dollar
# end

fzf --fish | source

starship init fish | source
