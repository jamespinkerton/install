#!/bin/bash

set -o errexit -o nounset -o xtrace

source $(dirname "$0")/dotfiles.sh git@github.com:jamespinkerton/dotfiles.git
