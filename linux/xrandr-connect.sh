#!/bin/sh
intern=LVDS1
extern=VGA1

if xrandr | grep "$extern connected"; then
  xrandr --output "$intern" --off --output "$extern" --auto
fi
