#!/bin/bash
set -o errexit -o nounset -o xtrace

if [[ -n "$(command -v apt-get)" ]]; then
    sudo apt-get -y update
    sudo apt-get -y install build-essential curl file git python-setuptools ruby
    sudo apt-get -y install cmake llvm clang gcc libc6 git mercurial tmux wget htop emacs curl vim neovim mailutils
    # sudo apt-get -y install texlive
elif [[ -n "$(command -v yum)" ]]; then
    sudo yum -y update
    sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb python-setuptools ruby
    sudo yum -y groupinstall gcc git mercurial tmux wget htop emacs curl vim
else
    echo "Warning. Neither yum nor apt-get is installed."
fi

# tlmgr update --self && tlmgr install texliveonfly

# ****** Install MiniConda ******
if [[ ! $(which conda) ]]; then
    rm -f ~/miniconda.sh
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    /bin/bash ~/miniconda.sh -b
    rm -f ~/miniconda.sh
fi
export PATH=$HOME/miniconda3/bin:$PATH
conda update --all python=3 -y
conda install ipython -y

# ********** Misc. **********
source ~/.bash_profile
vi +PlugInstall +qa # Won't work in redhat for some reason???
