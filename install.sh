#!/bin/bash
set -o errexit -o nounset

if [[ -n "$(command -v apt-get)" ]]; then
    sudo apt-get -y update
    sudo apt-get -y install build-essential curl git python-setuptools ruby
elif [[ -n "$(command -v yum)" ]]; then
    sudo yum -y update
    sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb python-setuptools ruby
fi

[[ ! -d ~/.linuxbrew ]] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
export PATH=$HOME/.linuxbrew/bin:$PATH
brew install git hg tmux wget curl htop python python3 vim emacs mailutils

pip3 install --upgrade pip
pip3 install --user scipy numpy pandas scikit-learn ipython jupyter seaborn matplotlib mypy-lang powerline-status

GITDIR=$(cd $(dirname $0) && pwd)
$GITDIR/link.sh

source ~/.bashrc

# Won't work for some reason:
sudo vi +PlugInstall +qa
