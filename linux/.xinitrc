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

# key bindings
xbindkeys                       # source ~/.xbindkeysrc
setxkbmap -option ctrl:nocaps   # map CapsLock to LControl
xmodmap -e "keycode 37="        # unmap LControl

# adjust typematic rate of keyboard
xset r rate 200 60

# set wallpaper
hsetroot -cover "$HOME/.config/wallpaper.png"

xautolock -time 10 -locker slock &
#picom &
exec dwm
