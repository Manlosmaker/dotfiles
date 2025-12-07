#!/usr/bin/env bash

LID="/proc/acpi/button/lid/LID0/state"
INTERNAL="eDP-1"   # typically eDP-1 or eDP-1, check with `hyprctl monitors`

while inotifywait -e modify "$LID"; do
    state=$(cat "$LID" | awk '{print $2}')

    if [[ "$state" == "closed" ]]; then
        # Lid closed → disable internal screen
        hyprctl keyword monitor "eDP-1,disable"
    else
        # Lid open → re-enable internal screen automatically
        hyprctl reload
    fi
done

