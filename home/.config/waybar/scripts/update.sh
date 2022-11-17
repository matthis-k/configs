#!/bin/sh

notify-send 'Starting update...'
paru -Syyu --noconfirm && notify-send 'Update complete' || notify-send 'Update failed...'

pkill -SIGRTMIN+8 waybar
