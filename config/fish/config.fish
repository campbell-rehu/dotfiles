if status is-interactive
	# Source cargo for rust development 
	bass source ~/.cargo/env 
end

alias vim="lvim"

alias edit-fish="lvim ~/.config/fish/config.fish"
alias refresh-fish="source ~/.config/fish/config.fish" 

set -U fish_greeting

# Use the custom-config.fish file for additional fish config options
source ~/.config/fish/custom-config.fish
