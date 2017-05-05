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

sudo apt-get install -y proxychains
sudo apt-get install -y git
sudo apt-get install -y zsh
sudo apt-get install -y ctags
sudo apt-get install silversearcher-ag

sh -c "$(curl -fsSL https://raw.githubusercontent.com/bjzhush/oh-my-zsh/master/tools/install.sh)"
sudo -H sh -c "$(curl -fsSL https://raw.githubusercontent.com/bjzhush/oh-my-zsh/master/tools/install.sh)"

rm -f ~/.vimrc
rm -f ~/.ideavimrc
rm -rf ~/.vim
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.conf
rm -rf ~/.zshrc

cd
ln -s /home/zs/linuxetc/vimrc ~/.vimrc
ln -s /home/zs/linuxetc/vimrc ~/.ideavimrc
ln -s /home/zs/linuxetc/vim/ ~/.vim
ln -s /home/zs/linuxetc/gitconfig ~/.gitconfig
ln -s /home/zs/linuxetc/gitignore ~/.gitignore
ln -s /home/zs/linuxetc/tmux.conf ~/.tmux.conf
ln -s /home/zs/linuxetc/zshrc ~/.zshrc

#sudo
sudo rm -f  /root/.vimrc
sudo rm -rf /root/.vim
sudo rm -rf /root/.gitconfig
sudo rm -rf /root/.gitignore
sudo rm -rf /root/.tmux.conf
sudo rm -rf /root/.zshrc

sudo ln -s /home/zs/linuxetc/vimrc /root/.vimrc
sudo ln -s /home/zs/linuxetc/vim/ /root/.vim
sudo ln -s /home/zs/linuxetc/gitconfig /root/.gitconfig
sudo ln -s /home/zs/linuxetc/gitignore /root/.gitignore
sudo ln -s /home/zs/linuxetc/tmux.conf /root/.tmux.conf
sudo ln -s /home/zs/linuxetc/zshrc /root/.zshrc

sudo apt-get install python-pip
sudo pip install mycli

echo "All Done"
