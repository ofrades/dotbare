#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 30 \
        --delay 0.3 \
        --match-command "playerctl --player=playerctld status" \
        --match-text "Playing" "--scroll 0" \
        --match-text "Paused" "--scroll 0" \
        --update-check true ~/.config/bspwm/scripts/get_spotify_status.sh &
wait
