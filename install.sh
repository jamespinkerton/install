#!/bin/bash
set -o errexit -o nounset

GITDIR=$(cd $(dirname $0) && pwd)
$GITDIR/link.sh

PACKAGES="git hg tmux wget curl htop python vim emacs"
if [[ -n "$(command -v apt-get)" ]]; then
    sudo apt-get install python3
    sudo apt-get install $PACKAGES mailutils
elif [[ -n "$(command -v yum)" ]]; then
    sudo yum -y update
    sudo yum -y install epel-release
    sudo yum -y install python35 python35-setuptools
    sudo easy_install-3.5 pip
    sudo yum -y install $PACKAGES mailx
fi

pip3 install --user scipy numpy pandas scikit-learn ipython seaborn matplotlib mypy-lang powerline-status

source ~/.bashrc

# Won't work for some reason:
# vi +PlugInstall +qa
