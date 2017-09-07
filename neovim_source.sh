#!/bin/bash

set -o errexit -o nounset -o xtrace

git clone https://github.com/neovim/neovim ~/packages/neovim
cd ~/packages/neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.neovim"
make install
