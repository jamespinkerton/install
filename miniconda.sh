#!/bin/bash
if [[ ! $(which conda) ]]; then
    MINI_LOC=~/miniconda.sh
    rm -f $MINI_LOC
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINI_LOC
    /bin/bash $MINI_LOC -b
    rm -f $MINI_LOC
fi
MINICONDA=$HOME/miniconda3/bin
$MINICONDA/conda update -y --all python=3
$MINICONDA/conda install -y pandas numpy ipython
