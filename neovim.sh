#!/bin/bash

set -o errexit -o nounset -o xtrace

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
sudo apt-get install fuse
./nvim.appimage
