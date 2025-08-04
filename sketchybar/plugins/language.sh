#!/bin/bash

# plugins/language.sh
# SketchyBar plugin to display current keyboard language with real-time updates

PREF_FILE="$HOME/Library/Preferences/com.apple.HIToolbox.plist"

get_language() {
    LANG=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | \
           grep -o '"KeyboardLayout Name" = "[^"]*"' | \
           sed 's/"KeyboardLayout Name" = "\(.*\)"/\1/' | \
           head -1)

    if [ -z "$LANG" ]; then
        LANG=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | \
               grep -o '"Input Mode" = "[^"]*"' | \
               sed 's/"Input Mode" = "\(.*\)"/\1/' | \
               head -1)
    fi

    if [ -z "$LANG" ]; then
        BUNDLE_ID=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | \
                    grep -o '"Bundle ID" = "[^"]*"' | \
                    sed 's/"Bundle ID" = "\(.*\)"/\1/' | \
                    head -1)
        
        case "$BUNDLE_ID" in
            "com.apple.keylayout.US")
                LANG="EN"
                ;;
            "com.apple.keylayout.Estonian")
                LANG="ET"
                ;;
            *)
                LANG="??"
                ;;
        esac
    fi

    # Fallback to abbreviated version if name is too long
    case "$LANG" in
        "U.S.")
            LANG="EN"
            ;;
        "Estonian")
            LANG="ET"
            ;;
        *)
            # If longer than 3 characters, take first 2 and uppercase
            if [ ${#LANG} -gt 3 ]; then
                LANG=$(echo "$LANG" | cut -c1-2 | tr '[:lower:]' '[:upper:]')
            fi
            ;;
    esac

    sketchybar --set language label="$LANG"
}

if ! command -v fswatch &> /dev/null; then
    echo "fswatch not found. Installing via Homebrew..."
    if command -v brew &> /dev/null; then
        brew install fswatch
    else
        echo "Error: Homebrew not found. Please install fswatch manually."
        exit 1
    fi
fi

pkill -f "fswatch.*HIToolbox.plist"

fswatch -o "$PREF_FILE" | while read; do
    sleep 0.1  # Small delay to ensure file is fully written
    get_language
done &

echo $! > /tmp/sketchybar_language_watcher.pid

get_language
