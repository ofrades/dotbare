# disable greeting
set fish_greeting
# vim
fish_vi_key_bindings
# Example aliases
alias fconfig="nvim ~/.config/fish/config.fish"
alias bat='batcat'

# ls
abbr l 'ls -lh'
abbr ll 'ls -lah'
abbr la 'ls -A'
abbr lm 'ls -m'
abbr lr 'ls -R'
abbr lg 'ls -l --group-directories-first'

# git
abbr ga 'git add'
abbr gc 'git commit -am'
abbr gp 'git pull'

# neovim
abbr vi 'nvim'
abbr vim 'nvim'
alias vi='nvim'
alias vim='nvim'

abbr mv 'mv -iv'
abbr cp 'cp -riv'
abbr mkdir 'mkdir -vp'
abbr z 'j'

# dotbare config
alias configs="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# tmux
abbr t tmux
abbr tc 'tmux attach'
abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'

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
