# dotfiles

Repository for storing my configuration dotfiles

# Tools

- [Alacritty](https://alacritty.org/)
- [tmux](https://github.com/tmux/tmux)
- [fish shell](https://fishshell.com/)
- [Neovim](https://github.com/neovim/neovim)

# How to use

```bash
./setup.sh [--dry-run] # pass the --dry-run option to verify the changes before actually running it
```

Note: the script will overwrite any existing config you have in the `~/.config` directory for the above tools.

## Manually

1. Clone the repo
2. Copy the contents of the `config` directory to the `$HOME/.config` directory
