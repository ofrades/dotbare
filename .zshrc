# Delete % symbol
unsetopt PROMPT_SP

# Path to your oh-my-zsh installation.
export ZSH="/home/ofrades/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
	git
  fzf-tab
	zsh-syntax-highlighting
  zsh-autosuggestions
  dotbare
)

# Oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Find string in files
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Missing string to search for"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf-down --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Navigate directories
fcd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf-down --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}
  
# Command history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf-down +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

tsh() {
  tmux split -h
}

tsv() {
  tmux split -v
}

# Tmux Session
ft() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf-down --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# Switch Current Tmux Session
fts() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf-down --reverse --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# Kill Tmux Session
ftk () {
    local sessions
    sessions="$(tmux ls|fzf-down --exit-0 --multi)"  || return $?
    local i
    for i in "${(f@)sessions}"
    do
        [[ $i =~ '([^:]*):.*' ]] && {
            echo "Killing $match[1]"
            tmux kill-session -t "$match[1]"
        }
    done
}

# GIT heart FZF

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# Git Status
fgs() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

# Git Branch
fgb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# Git Tag
fgt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

# Git Log
fgl() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

# Git Remote
fgr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# Git Stash
fgstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf-down --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# Kill process
fkp() {
  local pid
  pid=$(ps -ef | sed 1d | fzf-down -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# Chrome history (change browser and browser history path)
ch() {
  local cols sep
  browser='google-chrome'
  browser-path='~/.config/google-chrome/Default/History'
  export cols=$(( COLUMNS / 3 ))
  export sep='{::}'

  cp -f browser-path /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select title, url from urls order by last_visit_time desc" |
  ruby -ne '
    cols = ENV["cols"].to_i
    title, url = $_.split(ENV["sep"])
    len = 0
    puts "\x1b[36m" + title.each_char.take_while { |e|
      if len < cols
        len += e =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/ ? 2 : 1
      end
    }.join + " " * (2 + cols - len) + "\x1b[m" + url' |
  fzf-down --ansi --multi --no-hscroll --tiebreak=index |
  sed 's#.*\(https*://\)#\1#' | xargs browser
}

# FZF Defaults
# Window Size
fzf-down() {
  fzf --height 50% "$@" --border
}

export FZF_DEFAULT_OPTS='
    --multi
    --reverse
    --preview "([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200" 
    --color="hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008"
    --bind "?:toggle-preview"
    --bind "ctrl-a:select-all"
    --bind "alt-j:preview-down,alt-k:preview-up"
    --bind "ctrl-y:execute-silent(echo {+} | pbcopy)"
    --bind "ctrl-v:execute(echo {+} | xargs -o vim)"
    --bind "ctrl-c:execute(code-insiders {+})"
'

#export FZF_DEFAULT_COMMAND='rg --files'

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
