# disable greeting
set fish_greeting
# vim
fish_vi_key_bindings
# Example aliases
alias fconfig="nvim ~/.config/fish/config.fish"
alias bat='batcat'

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias ga='git add'
alias gc='git commit -am'
alias gp='git pull'

alias e='nvim'
alias edit='nvim'
alias vi='nvim'
alias vim='nvim'

alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -vp'
alias z='j'

# dotbare config
alias configs="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"


# Environment Variables
set -ga fish_user_paths /usr/local/go/bin
set -ga fish_user_paths ~/.local/bin
set -ga fish_user_paths ~/.yarn/bin
set -x DENO_INSTALL /Users/YOUR_USER/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
set -ga fish_user_paths ~/.cargo/bin

set -gx EDITOR nvim

starship init fish | source

# autojump
status --is-interactive; and source (jump shell fish | psub)

#xrandr --output HDMI-0 --mode 1920x1080 --rate 59.00 && xrandr --output VGA-1-1 --mode 1920x1080
