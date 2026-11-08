#!/bin/bash
#Description: Helper file to write user.js to $HOME/.mozilla/firefox/*.default* folder in order to fix issues with text visibility in input fields with some themes
TARGETPATH=$(find "$HOME/.mozilla/firefox/" -maxdepth 1 -type d \( -name '*.default-release' -o -name '*.default' \) 2>/dev/null | head -n 1)
if [ -n "$TARGETPATH" ] && [ -d "$TARGETPATH" ]; then
    TARGETFILE="$TARGETPATH/user.js"
    TARGETSTRING="user_pref(\"widget.content.gtk-theme-override\", \"Adwaita\");"
    if [ ! -f "$TARGETFILE" ]; then
        touch "$TARGETFILE"
        echo "creating file $TARGETFILE"
        echo ""
    fi
    if ! grep -Fq "widget.content.gtk-theme-override" "$TARGETFILE"; then
        echo "$TARGETSTRING" >> "$TARGETFILE"
        echo "writing string '$TARGETSTRING' to $TARGETFILE"
        echo ""
        echo "please restart Firefox for fix to take effect"
    else
        echo "$TARGETFILE already contains a widget.content.gtk-theme-override"
    fi
else
    echo "could not locate your .default or .default-release firefox profile"
fi
if [ -t 1 ]; then
    echo "";
    read -rp "Press enter to exit the script.";
fi
exit
