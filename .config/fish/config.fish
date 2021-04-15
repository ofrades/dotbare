# disable greeting
set fish_greeting
# vim
fish_vi_key_bindings
# Example aliases
alias zconfig="nvim ~/.zshrc"
alias fconfig="nvim ~/.config/fish/config.fish"
alias dots="dotbare fedit"
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

alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -vp'


alias dotbare="~/git/dotbare/dotbare"
set -ga fish_user_paths /usr/local/go/bin
set -ga fish_user_paths ~/.local/bin
set -ga fish_user_paths ~/.yarn/bin
set -gx EDITOR nvim

starship init fish | source
