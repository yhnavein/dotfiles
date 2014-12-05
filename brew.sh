#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

brew install htop tmux vim

brew install wget curl zsh git mercurial tig

brew install node

brew install mysql postgresql

#Java stuff

brew install maven




# Remove outdated versions from the cellar.
brew cleanup