#!/bin/bash

PWD=`pwd`

ln -sf ${PWD}/.vimrc ~/.vimrc
ln -sf ${PWD}/.zshrc ~/.zshrc
mkdir ~/.vim
ln -sf ${PWD}/.tmux.conf ~/.tmux.conf

ln -sf ${PWD}/.bashrc ~/.bashrc
ln -sf ${PWD}/.bashrc_forcygwin ~/.bashrc_forcygwin
ln -sf ${PWD}/.bash_alias ~/.bash_alias
#ln -sf ${PWD}/.

