# Ask for the administrator password upfront.
sudo -v

# Installing Google Chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

apt-get update && apt-get install google-chrome-stable

# Installing usefult stuff


apt-get install -y vim git tig mercurial node zsh

apt-get install -y firefox

# Installing Sublime Text 3
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update && apt-get install sublime-text


wget --no-check-certificate http://install.ohmyz.sh -O - | sh
chsh -s `which zsh`

# Installing programmer stuff
apt-get install -y mysql-server-5.6 postgresql-9.3 htop tmux nginx php5 php5-fpm meld nodejs npm

#Fixing node.js on Ubuntu
sudo ln -s /usr/bin/nodejs /usr/local/bin/node

apt-get install -y php5-mysql php5-curl

#Some fonts
apt-get install -y ttf-ubuntu-font-family ttf-dejavu ttf-bitstream-vera fonts-cantarell fonts-droid fonts-inconsolata fdupes

#Installing Zeal (Dash for Linux)
add-apt-repository ppa:jerzy-kozera/zeal-ppa
apt-get update && apt-get install zeal

apt-get install conky-all transmission