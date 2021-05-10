#!/bin/bash
# resizes the window to full height and 50% width and moves into left right corner

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/common.sh"

# new width and height
W=$(( $SCREEN_WIDTH / 3 - $RIGHTMARGIN ))
H=$(( $SCREEN_HEIGHT/2 - $TOPMARGIN))

X=$SCREEN_OFFSET_WIDTH; 
#echo "X is: $X"
Y=$SCREEN_OFFSET_HEIGHT;

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H

# =1080+3840/3*0 = 1080
# =1080+3840/3 = 2360
# =1080+3840/3*2 = 3640