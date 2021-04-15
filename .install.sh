#!/bin/bash

# install linux essential stuff to work
mkdir -p ~/build
mkdir -p ~/git

sudo apt update

sudo apt-get install -y \
    fish make cmake git nodejs npm \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev ripgrep gh

# install yarn
if ! [ -d /usr/local/bin/yarn ]; then
  npm install --global yarn
fi


# install neovim
if ! [ -d $HOME/build/neovim ]; then
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim/
    make
    sudo make install
    npm install --global neovim
fi

# install terminal
if ! command -v kitty &> /dev/null ; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# get dotbare
if ! [ -d $HOME/git/dotbare ]; then
    git clone https://github.com/kazhala/dotbare.git ~/git/dotbare
fi

# get dotfiles
if ! [ -d $HOME/.config/nvim ]; then
    git clone https://github.com/ofrades/dotbare $HOME
fi
