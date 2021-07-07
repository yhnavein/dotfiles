#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# Ask for the administrator password upfront.
sudo -v

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".vimrc .vim .tigrc .gitconfig .tmux.conf .eslintrc .bashrc .inputrc .minttyrc .prettierrc .editorconfig"    # list of files/folders to symlink in homedir
configFiles="mimeapps.list"
fishFiles="alias.fish export.fish config.fish"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
  mv  ~/$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done

for file in $configFiles; do
  mv  ~/.config/$file ~/dotfiles_old/.config/
  echo "Creating symlink to .config/$file in ~/.config directory."
  ln -s $dir/.config/$file ~/.config/$file
done

for file in $fishFiles; do
  mv  ~/.config/fish/$file ~/dotfiles_old/.config/fish/
  echo "Creating symlink to .config/fish/$file in ~/.config/fish directory."
  ln -s $dir/fish-config/$file ~/.config/fish/$file
done
