#!/bin/sh

# When a udev event fires, the system properties of external output displays
# are not updated immediately.  This forces us to do poll for which output
# changed state.
#
# This script specifically handles connecting to a ThinkPad dock that is always
# connected to an extenral display on DP2.  Normally one could facilitate this
# by listening for docking signals, but for whatever reasons the dock hardware
# I use only sends events when it is connected; not disconnected.
#
# If after 15 seconds it detects that the DP2 connected/disconnected state has
# not changed, it will abort the script and no harm is done.  If the DP2 state
# changed, it will take connect- or disconnect actions.
#
# I don't normally add a lot of comments to my programs, but the udev system in
# general is quite mystical.  Consider this an exception.

# always enable laptop display first,
# in case something goes wrong
xrandr --output LVDS1 --auto

first_state=$(xrandr -q | grep DP2 | awk '{print $2}')

# poll until DP2 changes state or the timeout elapses
end=$(($(date +%s) + 15))
while [ $(date +%s) -le $end ]; do
	second_state=$(xrandr -q | grep DP2 | awk '{print $2}')
	if [ $first_state != $second_state ]; then
		break
	fi

	sleep 1
done

# if the state on DP2 is still the same as when we began,
# it means the change event did not originate from DP2
if [ $first_state = $second_state ]; then
	exit
fi

# switch off laptop display and on DP2 if cable was connected,
# or the reverse if it was disconnected
case $second_state in
	connected)
		xrandr --output DP2 --auto
		xrandr --output LVDS1 --off
		;;

	disconnected)
		xrandr --output LVDS1 --auto
		xrandr --output DP2 --off
		;;
esac

# reload key map profile as the dock has a keyboard connected,
# and tell the WM to restart so sticky windows are placed correctly
xmodmap /home/ato/.Xmodmap
FvwmCommand -f "/var/tmp/FvwmCommand-$(hostname)${DISPLAY}" Restart

