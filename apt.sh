# Ask for the administrator password upfront.
sudo -v

# Installing Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get update && apt-get install google-chrome-stable

# Installing Opera
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
apt-get update && apt-get install opera-stable

# Installing usefult stuff
apt-get install -y vim git tig fish exa

# apt-get install -y firefox # Sorry Firefox, Proton is disgusting

# Installing Sublime Text 3
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update && apt-get install sublime-text

# Old Oh My Zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# chsh -s `which zsh`

chsh -s `which fish`

# Install Postgres 14
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee  /etc/apt/sources.list.d/pgdg.list

# Installing programmer stuff
apt-get install -y postgresql-14 htop tmux nginx meld

#Installing Node.js v16
wget -qO- https://deb.nodesource.com/setup_16.x | sudo bash -
apt-get install --yes nodejs

#Some fonts
apt-get install -y ttf-ubuntu-font-family ttf-dejavu ttf-bitstream-vera fonts-cantarell fonts-droid fonts-inconsolata
apt-get install -y fonts-crosextra-carlito fonts-crosextra-caladea

#Tools
apt-get install -y fdupes neofetch lynx fail2ban duf ncdu jq

# More tools (https://packages.azlux.fr/)
echo "deb http://packages.azlux.fr/debian/ buster main" | tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | apt-key add -
apt-get update; apt-get install -y broot dog rclone


# Dotnet
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update; apt-get install -y apt-transport-https; apt-get install -y dotnet-sdk-5.0 # or aspnetcore-runtime-5.0 on server

# apt-get install -y conky-all transmission

# #Installing Teamocil
# apt-get install python-software-properties
# apt-add-repository ppa:brightbox/ruby-ng
# apt-get update
# apt-get install ruby2.1
# gem install teamocil

# #Installing Krita
# add-apt-repository ppa:dimula73/krita
# apt-get update
# apt-get install krita-2.9

#Install Java JRE and JDK
# apt-get install default-jre default-jdk

# Install GoAccess
# apt-get install goaccess
