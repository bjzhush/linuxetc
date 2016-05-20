#!/bin/sh

#
# ReLnfiles.sh
#
# Developed by zs
# Copyright (c) 2013 
# Licensed under terms of GNU General Public License.
# All rights reserved.
#
# Changelog:
# 2013-06-04 - created
# Create this file for re ln  linux config files from under git to real use
#

rm -f ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
rm -rf ~/.tmux.conf

cd
ln -s ~/linuxetc/vimrc ~/.vimrc
ln -s ~/linuxetc/vimrc ~/.ideavimrc
ln -s ~/linuxetc/vim/ ~/.vim
ln -s ~/linuxetc/gitconfig ~/.gitconfig
ln -s ~/linuxetc/gitignore ~/.gitignore
ln -s ~/linuxetc/tmux.conf ~/.tmux.conf

#sudo
sudo rm -f  /root/.vimrc
sudo rm -rf /root/.vim
sudo rm -rf /root/.gitconfig
sudo rm -rf /root/.gitignore
sudo rm -rf /root/.gitignore

sudo ln -s ~/linuxetc/vimrc /root/.vimrc
sudo ln -s ~/linuxetc/vim/ /root/.vim
sudo ln -s ~/linuxetc/gitconfig /root/.gitconfig
sudo ln -s ~/linuxetc/gitignore /root/.gitignore
sudo ln -s ~/linuxetc/tmux.conf /root/.tmux.conf

echo "All Done"
