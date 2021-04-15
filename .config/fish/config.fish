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

starship init fish | source
