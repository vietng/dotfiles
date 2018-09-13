#!/bin/sh
xrandr 	--output HDMI-2 --mode 1920x1080 --pos 5760x600 --rotate normal \
	--output HDMI-1 --off \
	--output DP-1 --primary --mode 3840x2160 --pos 1920x0 --rotate normal \
	--output eDP-1 --mode 1920x1080 --pos 0x600 --rotate normal \
	--output DP-2 --off
