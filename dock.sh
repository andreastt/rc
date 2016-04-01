#!/bin/sh

dock=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/status)
xrandr -q

case "$dock" in
	"connected")
	xrandr --verbose \
		--output LVDS1 --off \
		--output DP2 --auto
	;;

	"disconnected")
	xrandr --verbose --output LVDS1 --auto
	;;
esac

FvwmCommand -f "/var/tmp/FvwmCommand-i${DISPLAY}" Restart
xmodmap /home/ato/.Xmodmap

