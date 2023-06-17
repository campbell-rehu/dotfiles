# Check for --dry-run argument or invalid arguments
if [[ $1 == "--dry-run" ]]; then
    echo "Running in dry-run mode, no changes will be made."
    curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s -- "$1" $PWD/config ~/.config $PWD/config/lvim/custom-config.lua
elif [[ -n $1 ]]; then
    echo "Error: Invalid argument. Use --dry-run for dry run mode."
    exit 1
else
    echo "Running in normal mode."
    curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s -- $PWD/config ~/.config $PWD/config/lvim/custom-config.lua
fi
