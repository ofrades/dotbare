#!/bin/bash

# install linux essential stuff to work
# with pop-os

echo "-> Tools installation just started"

mkdir -p ~/build

sudo apt update

sudo apt-get install -y \
    tmux fzf bat ripgrep fd-find silversearcher-ag  \
    make cmake \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev \
    git nodejs npm python3-pip python3-neovim golang-go \
    texlive-luatex texlive-fonts-recommended texlive-fonts-extra latexmk \
    libltdl-dev flex bison fontforge python3-pygments \
    neofetch flameshot

echo "-> Essential linux packages installed"

# install yarn
if ! [ -x "$(command -v yarn)" ]; then
  echo "-> Yarn is installing"
  sudo npm install --global yarn
  elif ! [ -x "$(command -v prettier)" ]; then
    echo "-> Yarn apps installing"
    yarn global add prettier eslint eslint_d typescript
  else
    echo "-> Yarn already installed"
fi


# install neovim
if ! [ -d $HOME/build/neovim ]; then
    echo "-> Neovim installing"
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim/
    make
    sudo make install
    sudo npm install --global neovim
    cd ~/
else
    echo "-> Neovim already installed"
fi

# fish as default shell
if ! [ -x "$(command -v fish)" ]; then
    echo "-> Setting fish as default shell"
    sudo apt install fish
    chsh -s `which fish`
else
    echo "-> Fish already installed"
fi

# install starship
if ! [ -x "$(command -v starship)" ]; then
    echo "-> Installing starship"
    curl -fsSL https://starship.rs/install.sh | bash
else
    echo "-> Startship already installed"
fi

# install autojump
if ! [ -x "$(command -v jump)" ]; then
    echo "-> Autojump installing"
    wget https://github.com/gsamokovarov/jump/releases/download/v0.40.0/jump_0.40.0_amd64.deb
    sudo dpkg -i jump_0.40.0_amd64.deb
else
    echo "-> Autojump already installed"
fi

# get dotfiles
if ! [ -d $HOME/.cfg ]; then
    echo "-> Downloading dotfiles"
    git clone --bare https://github.com/ofrades/configs ~/.cfg
    echo "-> Moving dotfiles"
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -f
    echo "-> Remove dotfiles"
    sudo rm -r $HOME/configs
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
else
    echo "-> Dotfiles already present"
fi

# gnome-terminal
echo "-> Loading gnome-terminal configs"
dconf load /org/gnome/terminal/ < ~/.config/.gterminal

# rust
if ! [ -x "$(command -v cargo)" ]; then
    echo "-> Installing rust"
    curl https://sh.rustup.rs -sSf | sh
    # rust webassembly
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
    cargo install cargo-generate
    cargo install deno
else
    echo "-> Rust already installed"
fi

# jekyll
if ! [ -x "$(command -v jekyll)" ]; then
    echo "-> Installing jekyll"
    sudo gem install bundler jekyll
    sudo apt install ruby-dev
    sudo apt install pipenv
else
    echo "-> jekyll already installed"
fi

# install gregorio
if ! [ -d $HOME/build/gregorio ] && ! [ -x "$(command -v gregorio)" ]; then
    echo "-> Gregorio installing"
    git clone https://github.com/gregorio-project/gregorio ~/build/gregorio
    cd ~/build/gregorio
    ./build.sh
    sudo ./install.sh
    cd ~/
else
    echo "-> Gregorio already installed"
fi

