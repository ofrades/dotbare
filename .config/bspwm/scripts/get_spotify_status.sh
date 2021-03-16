#!/bin/bash

if [ "$(playerctl --player=playerctld status)" = "Stopped" ]; then
    echo ""
elif [ "$(playerctl --player=playerctld status)" = "Paused"  ]; then
    # polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 2 >/dev/null
    playerctl --player=playerctld metadata --format "{{ title }}"
else # Can be configured to output differently when player is paused
    # polybar-msg -p "$(pgrep -f "polybar now-playing")" hook spotify-play-pause 1 >/dev/null
    playerctl --player=playerctld metadata --format "{{ title }}"
fi
