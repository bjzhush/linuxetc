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
cd
ln -s ~/linuxetc/vimrc ~/.vimrc
ln -s ~/linuxetc/.vim/ ~/.vim
ln -s ~/linuxetc/.gitconfig ~/.gitconfig
ln -s ~/linuxetc/.gitignore ~/.gitignore
