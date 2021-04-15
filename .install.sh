
#!/bin/bash

mkdir -p ~/build
mkdir -p ~/git

sudo apt update

sudo apt-get install -y \
    make cmake git nodejs npm \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev 


if ! [ -d /usr/local/bin/yarn ]; then
  npm install --global yarn
  npm install --global neovim
fi

if ! [ -d $HOME/git/dotbare ]; then
    git clone https://github.com/kazhala/dotbare.git ~/git/dotbare
fi

if ! [ -d $HOME/build/neovim ]; then
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim/
    make
    sudo make install
fi

# {{{ Python tools

if ! [ -d $HOME/.pyenv ]; then
  curl https://pyenv.run | bash
fi

# {{{ Rust tools
# Check that rust is installed... otherwise should run this
if ! [ -x "$(command -v cargo)" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if ! command -v rust_analyzer &> /dev/null ; then
    git clone https://github.com/rust-analyzer/rust-analyzer ~/build/rust-analyzer
    cd ~/build/rust-analyzer
    cargo xtask install --server
fi

cargo install \
  git-trim \
  ripgrep \
  broot \
  starship

if ! [ -d ~/build/delta ]; then
  git clone https://github.com/dandavison/delta ~/build/delta

  cd ~/build/delta
  cargo install --path .
fi


# {{{ Zsh
sudo apt install fish

if ! [ -d $HOME/.config/oh-my-zsh/ ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  curl -fsSL https://starship.rs/install.sh | bash
fi

# Github
sudo apt install gh

if ! command -v kitty &> /dev/null ; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi
