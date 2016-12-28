#!/bin/bash
set -o errexit -o nounset

GITDIR=$(cd $(dirname $0) && pwd)
BACKUP=$HOME/.dotfiles.backup/
rm -rf $BACKUP
mkdir -p $BACKUP

for f in $(cd $GITDIR && ls -d _*); do
    SOURCE=$GITDIR/$f
    DEST=~/.${f:1}
    [[ -e $DEST ]] && cp -r $DEST $BACKUP
    rm -rf $DEST
    ln -s $SOURCE $DEST
done

source ~/.bashrc
