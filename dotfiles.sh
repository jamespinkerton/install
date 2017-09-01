#!/bin/bash

# Inspiration is from here:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

set -o errexit -o nounset -o xtrace

DOTFILES_REPO=$1
git clone --bare $DOTFILES_REPO $HOME/.cfg
git --git-dir=$HOME/.cfg/ config status.showUntrackedFiles no
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

source ~/.bash_profile
