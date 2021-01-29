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
# This is not reliable, it changes positions.  
#export SCREEN_WIDTH="${Xaxis[0]}"
#export SCREEN_HEIGHT="${Yaxis[0]}"

# Get numerical max, which should be the TV instead of the laptop screen
export SCREEN_WIDTH=$(( "${Xaxis[0]}" > "${Xaxis[1]}" ? "${Xaxis[0]}" : "${Xaxis[1]}" ))
export SCREEN_HEIGHT=$(( "${Yaxis[0]}" > "${Yaxis[1]}" ? "${Yaxis[0]}" : "${Yaxis[1]}" ))

# These offsets may or may not be needed depending on how you have arranged your laptop monitor and your TV monitor to line up
export SCREEN_OFFSET_WIDTH=0
export SCREEN_OFFSET_HEIGHT=0
#if [ "$SCREEN_WIDTH" == "${Xaxis[0]}" ]; then
#	export SCREEN_OFFSET_WIDTH="${Xaxis[1]}"
#fi
#if [ "$SCREEN_HEIGHT" == "${Yaxis[0]}" ]; then
#	export SCREEN_OFFSET_HEIGHT="${Yaxis[1]}"
#fi

#Debug
echo "Xaxis[0]: ${Xaxis[0]}"
echo "Xaxis[1]: ${Xaxis[1]}"
echo "Yaxis[0]: ${Yaxis[0]}"
echo "Yaxis[1]: ${Yaxis[1]}"
echo "SCREEN_WIDTH: $SCREEN_WIDTH"
echo "SCREEN_HEIGHT: $SCREEN_HEIGHT"
echo "SCREEN_OFFSET_WIDTH: $SCREEN_OFFSET_WIDTH"
echo "SCREEN_OFFSET_HEIGHT: $SCREEN_OFFSET_HEIGHT"

