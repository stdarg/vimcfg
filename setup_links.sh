#!/bin/bash
CWD=`pwd`
if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.bak
fi

ln -s ${CWD}/vimrc.vim ~/.vimrc

if [ -d ~/.vim ]
then
    mv ~/.vim ~/.vim.bak
fi
ln -s ${CWD}/vim ~/.vim

