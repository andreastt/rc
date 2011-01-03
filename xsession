#!/bin/bash

xsetroot -cursor_name left_ptr
xsetroot -solid black
#xpmroot /home/ato/important/212468675_52ef72465e_o.jpg
#habak -ms ~/important/212468675_52ef72465e_o.jpg

# Reassign Caps Lock to Left Control
xmodmap -e 'remove Lock = Caps_Lock'
xmodmap -e 'keysym Caps_Lock = Control_L'
xmodmap -e 'add Control = Control_L'

trayer --edge top --align right --SetDockType true --SetPartialStrut false --expand true --width 10 --transparent true --tint 0x000000 --height 12 &

#gnome-settings-daemon &
#gnome-session &
#gnome-power-manager &
#pidgin &
xscreensaver -no-splash &

if [ -x /usr/bin/nm-applet ] ; then
	nm-applet --sm-disable &
fi

if [ -x /usr/bin/gnome-power-manager ]; then
	sleep 3
	gnome-power-manager
fi

xmonad | ~/misc/xmobar/xmobar-0.9.bin
