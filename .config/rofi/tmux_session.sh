#! /usr/bin/env bash

theme="style_2"

dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 10 ))]}"

# comment this line to disable random colors
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
themes=($(ls -p --hide="launcher.sh" --hide="styles" $dir))
theme="${themes[$(( $RANDOM % 7 ))]}"

# rofi -no-lazy-grab -show drun \
# -modi run,drun,window \
# -theme $dir/"$theme"

function tmux_sessions()
{
    tmux list-session -F '#S'
}

TMUX_SESSION=$( (echo new; tmux_sessions) | rofi -dmenu -theme $dir/"$theme" -p "Select tmux session")

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
    kitty -e tmux new-session &
elif [[ -z "${TMUX_SESSION}" ]]; then
    echo "Cancel"
else
    kitty -e tmux attach -t "${TMUX_SESSION}" &
fi
