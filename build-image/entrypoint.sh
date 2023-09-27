#! /bin/bash

# set -x # print commands
set -e # exit on error
set -u # exit on undefined variable
set -o pipefail # exit if any command in a pipe fails

# create the registry dir in the cache if not already
mkdir -p $CARGO_CACHE/registry
# symlink the registry from cargo dir to the cache dir
ln -s $CARGO_CACHE/registry $CARGO_HOME/registry

# run cargo contract with supplied args
cargo contract "$@"
