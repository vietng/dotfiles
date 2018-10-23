#!/bin/bash
if [[ $1 == 1 ]]; then
	echo "No win swap"
	setxkbmap -option ctrl:swapcaps
else
	echo "Swap win"
	setxkbmap -option ctrl:swapcaps -option altwin:swap_lalt_lwin
fi
