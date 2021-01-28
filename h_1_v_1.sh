#!/bin/bash
# resizes the window to full height and 50% width and moves into left right corner

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/common.sh"

# new width and height
W=$(( $SCREEN_WIDTH / 3 - $RIGHTMARGIN ))
H=$(( $SCREEN_HEIGHT/2 - $TOPMARGIN))

X=0; 
Y=0

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H