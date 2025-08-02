#!/bin/bash
# Get all workspaces with windows
WORKSPACES_WITH_WINDOWS=$(aerospace list-workspaces --monitor focused --empty no)
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Update all workspaces (1-9)
for i in $(seq 1 9); do
    # Show workspace if it has windows OR if it's the focused workspace
    if echo "$WORKSPACES_WITH_WINDOWS" | grep -q "^$i$" || [ "$i" = "$FOCUSED_WORKSPACE" ]; then
        # Show workspace
        sketchybar --set space.$i drawing=on
        
        # Set focus state
        if [ "$i" = "$FOCUSED_WORKSPACE" ]; then
            sketchybar --set space.$i background.drawing=on
        else
            sketchybar --set space.$i background.drawing=off
        fi
    else
        # Hide workspace (has no windows and is not focused)
        sketchybar --set space.$i drawing=off
    fi
done
