#!/bin/bash

verifyCommand() {
    if ! command -v $1 &> /dev/null;
    then
        return 2
    fi
    return 1
}

installRequiredTools() {
    verifyCommand "tmux"
    if [[ $? == 2 ]]
    then
        echo "<tmux> could not be found"
    fi

    verifyCommand "nvim"
    if [[ $? == 2 ]]
    then
        echo "<nvim> could not be found"
        sudo apt-get install ninja-build gettext cmake unzip curl
        cd ~/
        git clone https://github.com/neovim/neovim
        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
    fi

    verifyCommand "lvim"
    if [[ $? == 2 ]]
    then
        echo "<lvim> could not be found"
        sudo apt-get install make python3-pip node
        curl https://sh.rustup.rs -sSf | sh
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
    fi

    echo "all required tools installed."
}

# Check for --dry-run argument or invalid arguments
if [[ $1 == "--dry-run" ]]; then
    echo "Running in dry-run mode, no changes will be made..."
    echo "[Dry-run] Installing required tools..."
    installRequiredTools
    curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s -- "$1" $PWD/config ~/.config $PWD/config/lvim/custom-config.lua $PWD/config/fish/custom-config.fish
elif [[ -n $1 ]]; then
    echo "Error: Invalid argument. Use --dry-run for dry run mode..."
    exit 1
else
    echo "Running in normal mode..."
    echo "Installing required tools..."
    installRequiredTools
    curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s -- $PWD/config ~/.config $PWD/config/lvim/custom-config.lua $PWD/config/fish/custom-config.fish
fi
