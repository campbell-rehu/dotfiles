dryRun="$1"
curl -O https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh
chmod +x ./run.sh
./run.sh $PWD/config ~/.config $dryRun
