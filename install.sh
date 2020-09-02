#!/bin/bash

echo "copy .vim"
sudo cp -r .vim/UltiSnips ~/.vim
sudo cp -r .vim/autoload ~/.vim
echo "copy .vimrc"
sudo cp .vimrc ~/.vimrc
echo "copy .Xresources" 
sudo cp .Xresources ~/.Xresources
echo "copy .bashrc"
sudo cp .bashrc ~/.bashrc
echo "copy .zshrc"
sudo cp .zshrc ~/.zshrc
echo "copy .tmux.conf"
sudo cp .tmux.conf ~/.tmux.conf
