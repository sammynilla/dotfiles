#!/bin/sh
# preferably this should be done in a systemd hook?
intern=LVDS1
extern=VGA1

while :; do
  if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
  fi
done
