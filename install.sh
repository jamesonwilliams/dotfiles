#!/usr/bin/env bash

set -x 

mkdir -p ~/.vim/plugin
curl -s https://raw.githubusercontent.com/bogado/file-line/master/plugin/file_line.vim > ~/.vim/plugin/file_line.vim

install .vimrc ~/
install .inputrc ~/

install .bashrc.reddit ~/
install .bashrc.ps1 ~/
install .bashrc.local ~/
install .bashrc.android ~/
if [ "$(uname)" == "Darwin" ]; then
    install .bashrc.darwin ~/
    echo ". ~/.bashrc" > ~/.bash_profile
fi

cat >> ~/.bashrc <<- EOF
# Installed by https://github.com/jamesonwilliams/dotfiles/blob/master/install.sh
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
[ -f ~/.bashrc.ps1 ] && . ~/.bashrc.ps1
[ -f ~/.bashrc.reddit ] && . ~/.bashrc.reddit
[ -f ~/.bashrc.darwin ] && . ~/.bashrc.darwin
[ -f ~/.bashrc.android ] && . ~/.bashrc.android

EOF

[ -d ~/.config ] && install .config/user-dirs.dirs ~/.config/

