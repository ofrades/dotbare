# TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7
    
    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment
    
    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

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
abbr gl 'git log -p'

# neovim
abbr v 'nvim'
abbr vi 'nvim'
abbr vim 'nvim'
alias v='nvim'
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
set -ga NVM_DIR ~/.nvm
set --universal nvm_default_version v14
set -gx EDITOR nvim

starship init fish | source

# autojump
status --is-interactive; and source (jump shell fish | psub)
