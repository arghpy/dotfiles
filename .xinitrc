#!/bin/sh

setxkbmap -option caps:escape

xwallpaper --zoom $(echo "${HOME}/pictures/wallpapers/astronaut.jpeg")

touchpad_tap

nm-applet &

picom &

pa-applet &

exec i3
