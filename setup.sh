dryRun="$1"
curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s $PWD/config ~/.config $dryRun 
