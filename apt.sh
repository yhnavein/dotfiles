# Ask for the administrator password upfront.
sudo -v

# Installing Google Chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

apt-get update && apt-get install google-chrome-stable

# Installing usefult stuff

apt-get install -y vim git tig mercurial node fish

apt-get install -y firefox

# Installing Sublime Text 3
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update && apt-get install sublime-text

# Old Oh My Zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# chsh -s `which zsh`

chsh -s `which fish`

# Installing programmer stuff
apt-get install -y mysql-server-5.7 postgresql-9.6 htop tmux nginx meld

# Installing PHP stuff
apt-get install -y php5 php5-fpm php5-mysql php5-curl

#Installing Node.js v4
wget -qO- https://deb.nodesource.com/setup_6.x | sudo bash -
apt-get install --yes nodejs

#Some fonts
apt-get install -y ttf-ubuntu-font-family ttf-dejavu ttf-bitstream-vera fonts-cantarell fonts-droid fonts-inconsolata fdupes
apt-get install -y fonts-crosextra-carlito fonts-crosextra-caladea

apt-get install -y conky-all transmission

#Installing Teamocil
apt-get install python-software-properties
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
apt-get install ruby2.1
gem install teamocil

#Installing Krita
add-apt-repository ppa:dimula73/krita
apt-get update
apt-get install krita-2.9

#Install Java JRE and JDK
apt-get install default-jre default-jdk
