#!/bin/bash
# resizes the window to full height and 50% width and moves into upper right corner

#define the height in px of the top system-bar:
#seems unneded in 20.04
TOPMARGIN=0

#sum in px of all horizontal borders:
# seems unneeded in 20.04
RIGHTMARGIN=0

# This method does not work with multiple monitors ... gives total resolution
# get width of screen and height of screen
#SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
#SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')

# Get screen dimensions for each monitor separated by spaces
Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)

# Debug
#echo "Xaxis: $Xaxis"
#echo "Yaxis: $Yaxis"

# Convert to array
Xaxis=(${Xaxis[@]})
Yaxis=(${Yaxis[@]})

# Grab first monitor simensions which is my TV dimensions
export SCREEN_WIDTH="${Xaxis[0]}"
export SCREEN_HEIGHT="${Yaxis[0]}"

echo "Width: $SCREEN_WIDTH"
echo "Height: $SCREEN_HEIGHT"
