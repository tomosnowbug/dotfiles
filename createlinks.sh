#!/bin/bash

PWD=`pwd`

ln -sf ${PWD}/.vimrc ~/.vimrc
ln -sf ${PWD}/.zshrc ~/.zshrc
mkdir ~/.vim
#ln -sf ~/git/dotfiles/.bashrc ~/.bashrc
ln -sf ${PWD}/.tmux.conf ~/.tmux.conf


