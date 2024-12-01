#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xbindkeys # source ~/.xbindkeysrc

./xrandr-disconnect.sh & # xrandr disconnect hook
# ./xrandr-connect.sh      # turn off laptop monitor if external monitor is enabled.

# sets wallpaper using hsetroot and imlib2
wallpaperbg="$HOME/.config/wallpaper.jpg"
[ -f "$wallpaperbg" ] && hsetroot -solid rgb:16/16/16 -cover "$wallpaperbg"

dwmblocks &
# exec dwm

# allow for quick reloading of dwm when sigkill
while :; do
  ssh-agent dwm
done
