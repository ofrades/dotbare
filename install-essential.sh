#!/bin/bash

# install linux essential stuff to work
mkdir -p ~/build

sudo apt update

sudo apt-get install -y \
    kitty fish tmux fzf bat ripgrep fd-find silversearcher-ag  \
    make cmake \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev \
    git nodejs npm python3-pip python3-neovim golang-go \
    texlive-luatex texlive-fonts-extra latexmk


echo "1 - Essential linux packages installed"

# install yarn

if ! [ -x "$(command -v yarn)" ]; then
	echo "2 - Yarn is installing"
  sudo npm install --global yarn
else
	echo "2 - Yarn already installed"

  if ! [ -x "$(command -v prettier)" ]; then
    echo "2 - Yarn apps installing"
    yarn global add prettier eslint eslint_d typescript
  else
    echo "2 - Prettier already installed"
  fi

fi


# install neovim
if ! [ -d $HOME/build/neovim ]; then
    echo "3 - Neovim installing"
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim/
    make
    sudo make install
    sudo npm install --global neovim
else
	echo "3 - Neovim already installed"
fi

# get dotfiles
if ! [ -d $HOME/.cfg ]; then
    echo "5 - Downloading dotfiles"
    git clone --bare https://github.com/ofrades/dotfiles ~/.cfg
    echo "5 - Moving dotfiles"
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -f
else
	echo "5 - Dotfiles already present"
fi

# fish as default shell
if ! [ -x "$(command -v fish)" ]; then
    echo "6 - Setting fish as default shell"
    chsh -s /usr/bin/fish
fi

# install starship
if ! [ -x "$(command -v starship)" ]; then
    echo "7 - Installing starship"
    curl -fsSL https://starship.rs/install.sh | bash
fi

# install pop shell
if ! [ -d $HOME/build/shell ]; then
    echo "8 - Pop shell installing"
    git clone https://github.com/pop-os/shell ~/build/shell
    cd ~/build/shell/
    make local-install
else
	echo "8 - Pop shell already installed"
fi

# install autojump
if ! [ -x "$(command -v jump)" ]; then
    echo "9 - Autojump installing"
    wget https://github.com/gsamokovarov/jump/releases/download/v0.40.0/jump_0.40.0_amd64.deb
    sudo dpkg -i jump_0.40.0_amd64.deb
else
	echo "9 - Autojump already installed"
fi

# install gregorio
if ! [ -d $HOME/build/gregorio ]; then
    echo "10 - Gregorio installing"
    git clone https://github.com/gregorio-project/gregorio ~/build/gregorio
    cd ~/build/gregorio
    ./build.sh
    sudo ./install.sh
else
	echo "10 - Gregorio already installed"
fi
