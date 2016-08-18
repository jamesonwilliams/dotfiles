#!/usr/bin/env bash

set -x 

install .vimrc ~/
install .inputrc ~/

install .bashrc.local ~/
cat >> ~/.bashrc <<- EOF

[ -f ~/.bashrc.local ] && . ~/.bashrc.local

EOF

[ -d ~/.config ] && install .config/user-dirs.dirs ~/.config/
