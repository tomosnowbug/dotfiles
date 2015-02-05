#!/bin/bash

PWD=`pwd`

ln -sf ${PWD}/.vimrc ~/.vimrc
mkdir ~/.vim
#ln -sf ~/git/dotfiles/.bashrc ~/.bashrc
ln -sf ${PWD}/.tmux.conf ~/.tmux.conf


