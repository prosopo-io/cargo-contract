#! /bin/bash

set -e # exit on error
set -u # exit on undefined variable
set -o pipefail # exit if any command in a pipe fails
set -x # print commands

# symlink the git and registry from cargo dir to the cache dir
echo "Removing symlinks for cargo cache from previous runs..."
rm $CARGO_HOME/registry || true
rm $CARGO_HOME/git || true

echo "Adding symlinks for cargo cache..."
ln -s $CARGO_CACHE/registry $CARGO_HOME/registry
ln -s $CARGO_CACHE/git $CARGO_HOME/git

# run cargo contract with supplied args
echo "Running cargo contract..."
cargo contract "$@"
