#!/bin/bash
set -o errexit -o nounset -o xtrace

if [[ -z "$(command -v apt-get)" ]]; then
    echo "This only works with apt-get."
    exit 1
fi

sudo apt-get -y install build-essential curl file git python-setuptools ruby cmake llvm clang gcc libc6 git mercurial tmux wget htop emacs curl vim neovim mailutils

# Install latex
# sudo apt-get -y install texlive
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
