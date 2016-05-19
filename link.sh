TEMPDOTFILES=$HOME/.dofile.backup.temp
DOTFILES=$HOME/.dotfile.backup/
if [ -d "$DOTFILES" ]; then
    echo "Backup folder already exists"
    exit 1
fi
mkdir -p $DOTFILES
GITDIR=$(dirname $(realpath $0))
link_file () {
    cp $1 $DOTFILES
    mv $1 $TEMPDOTFILES
    ln -s $GITDIR/$2 $1
    rm -rf $TEMPDOTFILES
}

link_file ~/.bashrc bashrc
link_file ~/.vimrc vimrc
link_file ~/.config/nvim/init.vim vimrc
link_file ~/.ssh/config ssh_config
link_file ~/.tmux.conf tmux.conf
