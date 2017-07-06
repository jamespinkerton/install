#!/bin/bash
set -o errexit -o nounset -o xtrace

if [[ -n "$(command -v apt-get)" ]]; then
    sudo apt-get -y update
    sudo apt-get -y install build-essential curl git python-setuptools ruby
elif [[ -n "$(command -v yum)" ]]; then
    sudo yum -y update
    sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb python-setuptools ruby
fi

[[ ! -d /home/linuxbrew/.linuxbrew ]] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

brew install python python3
pip3 install --upgrade pip
pip3 install --user scipy numpy pandas scikit-learn ipython jupyter seaborn matplotlib mypy-lang powerline-status

#brew install texlive
#tlmgr update --self
#tlmgr install texliveonfly

brew install gcc git hg tmux wget htop python python3 emacs
# brew install mailutils
# brew install gawk glibc # gawk is a prereq but seems to have problems in debian
# brew install neovim/neovim/neovim # Won't work in redhat for some reason???

GITDIR=$(cd $(dirname $0) && pwd)
$GITDIR/link.sh

brew install curl vim
vi +PlugInstall +qa # Won't work in redhat for some reason???

source ~/.bashrc
