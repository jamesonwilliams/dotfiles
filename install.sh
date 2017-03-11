#!/usr/bin/env bash

set -x 

mkdir -p ~/.vim/plugin
curl -s https://raw.githubusercontent.com/bogado/file-line/master/plugin/file_line.vim > ~/.vim/plugin/file_line.vim

install .vimrc ~/
install .inputrc ~/

install .bashrc.amazon ~/
install .bashrc.ps1 ~/
install .bashrc.local ~/

cat >> ~/.bashrc <<- EOF
# Installed by https://github.com/jamesonwilliams/dotfiles/blob/master/install.sh
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
[ -f ~/.bashrc.ps1 ] && . ~/.bashrc.ps1
[ -f ~/.bashrc.amazon ] && . ~/.bashrc.amazon

EOF

[ -d ~/.config ] && install .config/user-dirs.dirs ~/.config/
