#!/bin/bash
set -o errexit -o nounset -o xtrace

if [[ -n "$(command -v apt-get)" ]]; then
    sudo apt-get -y update
    sudo apt-get -y install build-essential llvm clang gcc libc6 git mercurial tmux wget htop emacs curl vim neovim python-neovim python3-neovim mailutils python-setuptools
    # sudo apt-get -y install texlive
elif [[ -n "$(command -v yum)" ]]; then
    sudo yum -y update
    sudo yum groupinstall 'Development Tools' && sudo yum install curl git python-setuptools gcc git mercurial tmux wget htop emacs curl vim
elif
    echo "Warning. Neither yum nor apt-get is installed."
fi

# tlmgr update --self && tlmgr install texliveonfly

# ****** Install MiniConda ******
if [[ ! $(which conda) ]]; then
    MINI_LOC=~/miniconda.sh
    rm -f $MINI_LOC
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINI_LOC
    /bin/bash $MINI_LOC -b
    rm -f $MINI_LOC
fi
MINICONDA=$HOME/miniconda3/bin
$MINICONDA/conda update --all python=3 -y
$MINICONDA/conda install pandas numpy ipython -y

# ********** Misc. **********
source ~/.bash_profile
vi +PlugInstall +qa # Won't work in redhat for some reason???
