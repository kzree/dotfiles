#!/usr/bin/env bash

INTERNAL="eDP-1"
STATE_FILE="/tmp/hypr-internal-display-disabled"

if [ -f "$STATE_FILE" ]; then
    hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
    hyprctl reload
    rm "$STATE_FILE"
    notify-send "Internal display enabled"
else
    hyprctl keyword monitor "$INTERNAL,disable"
    touch "$STATE_FILE"
    notify-send "Internal display disabled"
fi
