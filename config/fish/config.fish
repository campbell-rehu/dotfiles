if status is-interactive
    # Source cargo for rust development 
    bass source ~/.cargo/env
end

alias edit-fish="nvim ~/.config/fish/config.fish"
alias refresh-fish="source ~/.config/fish/config.fish"
set -U fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

set -gx EDITOR vim

# Use the custom-config.fish file for additional fish config options
source ~/.config/fish/custom-config.fish

zoxide init fish | source
fzf --fish | source
