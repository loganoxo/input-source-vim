#!/usr/bin/env bash
set -eu
DATA_FILE="$HOME/.input-source-vim/data"
INPUT_SOURCE_FLAG="0"
DATA="0"
if [ -f "$DATA_FILE" ]; then
    DATA=$(cat "$DATA_FILE")
    if [[ $(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID) =~ com.apple.keylayout.ABC ]] ; then
        INPUT_SOURCE_FLAG="0"
    else
        INPUT_SOURCE_FLAG="1"
    fi
    if [ "$DATA" !=  "$INPUT_SOURCE_FLAG" ]; then
        # input-source.scpt can be open by MacOs script-editor.app
        osascript "$HOME/.input-source-vim/input-source.scpt"
    fi
fi
