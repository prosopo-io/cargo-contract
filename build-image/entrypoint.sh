#! /bin/bash

# set -x # print commands
set -e # exit on error
set -u # exit on undefined variable

# symlink the cargo files to the cargo home directory
names=("bin" "env")
for name in "${names[@]}"; do
    rm $CARGO_CACHE/$name || true
    ln -s $CARGO_HOME/$name $CARGO_CACHE/$name
done

# put the cache in the path
export PATH=$CARGO_CACHE/bin:$PATH

# run cargo contract
cargo contract "$@"

# after cargo contract is run, remove the symlinks as there's no need to persist these
for name in "${names[@]}"; do
    rm $CARGO_CACHE/$name
done