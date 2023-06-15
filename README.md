# dotfiles

Repository for storing my configuration dotfiles

# Required tools

- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- [fish shell](https://fishshell.com/)
- [tmux](https://github.com/tmux/tmux)
- [Neovim](https://github.com/neovim/neovim)
- [LunarVim](https://www.lunarvim.org/)

# How to use

```bash
./setup.sh [dryRun] # optionally pass the dryRun argument to verify the changes before actually running it
```

Note: the script will overwrite any existing config you have in the `~/.config` directory for the above tools.

## Manually
1. Clone the repo
2. Copy the contents of the `config` directory to the `$HOME/.config` directory

