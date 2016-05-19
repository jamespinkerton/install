# sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb python-setuptools ruby
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
# This is equivalent to the above:
# git clone https://github.com/Linuxbrew/linuxbrew.git ~/.linuxbrew
export PATH=$HOME/.linuxbrew/bin:$PATH
brew install neovim/neovim/neovim mailutils
brew install tmux wget curl python python3 hg emacs htop
pip3 install numpy pandas scikit-learn ipython seaborn matplotlib
pip install --user powerline-status
pip3 install --user powerline-status
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
GITDIR=$(dirname $(realpath $0))
/bin/bash $GITDIR/link.sh
source ~/.bashrc
