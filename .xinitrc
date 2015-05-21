#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# load X resource settings
xrdb -load ~/.Xresources

# turn off bell
/usr/bin/xset b off

xmodmap ~/.Xmodmap &

# set desktop background
sh ~/.fehbg &

# start nm-applet
nm-applet &

# start i3
# !!! KEEP THIS AS THE LAST LINE
exec i3 -V >> ~/.i3/logs/i3log-$(date +'%F-%k-%M-%S') 2>&1
