#!/bin/sh

# When a udev event fires, the system properties of external output displays
# are not updated immediately.  This forces us to do poll for which output
# changed state.
#
# This script specifically handles connecting to a ThinkPad dock that is always
# connected to an external display on DP-1.  Normally one could facilitate this
# by listening for docking signals, but for whatever reasons the dock hardware
# I use only sends events when it is connected; not disconnected.
#
# If after 15 seconds it detects that the DP-1 connected/disconnected state has
# not changed, it will abort the script and no harm is done.  If the DP-1 state
# changed, it will take connect- or disconnect actions.
#
# I don't normally add a lot of comments to my programs, but the udev system in
# general is quite mystical.  Consider this an exception.

# always enable laptop display first,
# in case something goes wrong
xrandr --output eDP-1 --auto

first_state=$(xrandr -q | grep DP-1 | awk '{print $2}')

# poll until DP-1 changes state or the timeout elapses
end=$(($(date +%s) + 15))
while [ $(date +%s) -le $end ]; do
	second_state=$(xrandr -q | grep DP-1 | awk '{print $2}')
	if [ $first_state != $second_state ]; then
		break
	fi

	sleep 1
done

# if the state on DP-1 is still the same as when we began,
# it means the change event did not originate from DP-1
if [ $first_state = $second_state ]; then
	exit
fi

# switch off laptop display and on DP-1 if cable was connected,
# or the reverse if it was disconnected
case $second_state in
	connected)
		xrandr --output DP-1 --auto
		xrandr --output eDP-1 --off
		;;

	disconnected)
		xrandr --output eDP-1 --auto
		xrandr --output DP-1 --off
		;;
esac

# reload key map profile as the dock has a keyboard connected,
# and tell the WM to restart so sticky windows are placed correctly
xmodmap /home/ato/.Xmodmap
FvwmCommand -f "/var/tmp/FvwmCommand-$(hostname)${DISPLAY}" Restart

