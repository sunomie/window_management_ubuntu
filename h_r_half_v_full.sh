#!/bin/bash
# resizes the window to full height and 50% width and moves into left right corner

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/common.sh"

# new width and height
W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
#H=$(( $SCREEN_HEIGHT - $TOPMARGIN ))
H=$(( $SCREEN_HEIGHT - $TOPMARGIN))

# X, change to move left or right:

# moving to the right half of the screen:
X=$(( $SCREEN_WIDTH / 2 +$SCREEN_OFFSET_WIDTH));
# moving to the left:
#X=0; 

Y=$SCREEN_OFFSET_HEIGHT

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H
