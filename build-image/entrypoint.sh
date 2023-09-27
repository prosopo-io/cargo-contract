#! /bin/bash

# set -x # print commands
set -e # exit on error
set -u # exit on undefined variable
set -o pipefail # exit if any command in a pipe fails

# create the git and registry dir in the cache if not already
mkdir -p $CARGO_CACHE/registry
mkdir -p $CARGO_CACHE/git
# symlink the git and registry from cargo dir to the cache dir
ln -s $CARGO_CACHE/registry $CARGO_HOME/registry
ln -s $CARGO_CACHE/git $CARGO_HOME/git

# run cargo contract with supplied args
cargo contract "$@"
