#!/bin/bash

# Inspiration is from here:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

set -o errexit -o nounset -o xtrace

git clone --bare git@github.com:jamespinkerton/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config status.showUntrackedFiles no

source ~/.bash_profile
