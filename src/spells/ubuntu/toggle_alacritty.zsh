#!/usr/bin/env zsh

# Attempt to find an Alacritty window
WIN_ID=$(xdotool search --onlyvisible --class "Alacritty" | head -1)

if [ -z "$WIN_ID" ]; then
    # If Alacritty is not found, start it and run tmux
    alacritty -e tmux &
else
    # If Alacritty is found, check if it's currently active
    if xdotool getwindowfocus -f | grep -q $WIN_ID; then
        # If it's active, minimize it
        xdotool windowminimize $WIN_ID
    else
        # If it's not active, raise and focus it
        xdotool windowactivate $WIN_ID
    fi
fi

