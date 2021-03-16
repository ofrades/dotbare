#! /usr/bin/env bash

dir="$HOME/.config/bspwm/scripts/rofi"
rofi_command="rofi -theme $dir/powermenu.rasi"


# rofi -no-lazy-grab -show drun \
# -modi run,drun,window \
# -theme $dir/"$theme"

function tmux_sessions()
{
    tmux list-session -F '#S'
}

TMUX_SESSION=$( (echo new; tmux_sessions) | rofi -dmenu -theme ~/.config/bspwm/scripts/rofi/powermenu.rasi -p "Select tmux session")

if [[ x"new" = x"${TMUX_SESSION}" ]]; then
    kitty -e tmux new-session &
elif [[ -z "${TMUX_SESSION}" ]]; then
    echo "Cancel"
else
    kitty -e tmux attach -t "${TMUX_SESSION}" &
fi
