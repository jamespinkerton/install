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

if [[ ! -d ~/miniconda3 ]]; then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    /bin/bash ~/miniconda.sh -b
    rm -f ~/miniconda.sh
fi
# Not working:
# bash "$(curl -fsSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)" -b


export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
brew install gcc git hg tmux wget htop emacs curl vim || echo "Stuff was already installed?"
# Not working righ now
# brew install neovim # Won't work in redhat for some reason???
# brew install mailutils
# brew install gawk glibc # gawk is a prereq but seems to have problems in debian
# brew install texlive && tlmgr update --self && tlmgr install texliveonfly

# export PATH=$HOME/miniconda3/bin:$PATH
# conda update --all python=3 --yes
# conda install anaconda --yes #Will anaconda be updated?

vi +PlugInstall +qa # Won't work in redhat for some reason???
