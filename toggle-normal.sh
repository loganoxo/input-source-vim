#!/usr/bin/env bash
set -eu
DATA_FILE="$HOME/.input-source-vim/data"
DATA="0"
if ! [[ $(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID) =~ com.apple.keylayout.ABC ]] ; then
    DATA="1"
    # input-source.scpt can be open by MacOs script-editor.app
    osascript "$HOME/.input-source-vim/input-source.scpt"
fi
if [ -f "$DATA_FILE" ]; then
    echo -n "$DATA" > "$DATA_FILE"
fi
