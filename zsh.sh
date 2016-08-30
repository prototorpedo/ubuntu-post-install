#!bin/bash

# Install script for zsh and oh-my-zsh

sudo apt install zsh

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

chsh -s $(which zsh)