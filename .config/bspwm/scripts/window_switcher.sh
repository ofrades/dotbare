
#! /usr/bin/env bash


dir="$HOME/.config/bspwm/scripts/rofi"
rofi_command="rofi -theme $dir/powermenu.rasi"

# comment this line to disable random colors
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi


# rofi -no-lazy-grab -show drun \
# -modi run,drun,window \
# -theme $dir/"$theme"

rofi -show window -theme ~/.config/bspwm/scripts/rofi/powermenu.rasi

