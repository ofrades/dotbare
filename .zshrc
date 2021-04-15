# vi-mode
set -o vi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  archlinux
  fzf
  git
  gitignore
  node
  npm
  zsh-syntax-highlighting
  zsh-autosuggestions
  dotbare
  zsh-vi-mode
  zsh-z
  z
)

source $ZSH/oh-my-zsh.sh

alias zconfig="nvim ~/.zshrc"
alias dots="dotbare fedit"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# vscode
alias bat='batcat'

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -am'
alias gp='git push'
alias ct='bat ~/.gitmessage'

alias e='nvim'
alias v='nvim'
alias vim='nvim'
alias pt='keyboard pt'
alias us='keyboard us'
alias mail='neomutt'

alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -vp'

# kitty
alias kdiff="kitty +kitten diff"
alias kicat="kitty +kitten icat"
alias config='/usr/bin/git --git-dir=/home/ofrades/.cfg/ --work-tree=/home/ofrades'

export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$(pwd)/git-fuzzy/bin:$PATH
export PATH="$(yarn global bin):$PATH"
if [ -e /home/ofrades/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ofrades/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(starship init zsh)"
