#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap pt || setxkbmap us
