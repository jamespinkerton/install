/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install mobile-shell
brew install coreutils
brew install bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
gcloud compute firewall-rules create default-allow-mosh --allow=udp:60000-61000