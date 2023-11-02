#!/bin/bash

PWD=`pwd`

mv ~/.vimrc ~/.vimrc_orig
ln -sf ${PWD}/.vimrc ~/.vimrc
mkdir ~/.vim

mv ~/.zshrc ~/.zshrc_orig
ln -sf ${PWD}/.zshrc ~/.zshrc

mv ~/.tmux.conf ~/.tmux.conf_orig
ln -sf ${PWD}/.tmux.conf ~/.tmux.conf

mv ~/.bashrc ~/.bashrc_orig
ln -sf ${PWD}/.bashrc ~/.bashrc
ln -sf ${PWD}/.bashrc_forcygwin ~/.bashrc_forcygwin
ln -sf ${PWD}/.bash_aliases ~/.bash_aliases
#ln -sf ${PWD}/.
