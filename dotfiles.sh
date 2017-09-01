#!/bin/bash

# Inspiration is from here:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

set -o errexit -o nounset -o xtrace

DOTFILES_REPO=git@github.com:jamespinkerton/dotfiles.git
git clone --bare $DOTFILES_REPO $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config status.showUntrackedFiles no

source ~/.bash_profile
