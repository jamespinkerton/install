git clone --bare git@github.com:jamespinkerton/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p $HOME/.config-backup
echo "Backing up pre-existing dot files."
FILES="$(config checkout 2>&1 | egrep "\s+\." | awk {'print $1'})"
for element in $FILES; do
    dest=$HOME/.config-backup/$element
    mkdir --parents "$(dirname $dest)" 
    mv $HOME/$element $dest
done
config checkout
config config status.showUntrackedFiles no
