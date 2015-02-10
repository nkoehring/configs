#!/bin/sh

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
panel_height=48

for monitor in $(hc list_monitors | cut -d: -f1)
do
    hc pad $monitor $panel_height
done

sh ~/.config/herbstluftwm/tag_status.sh | xmobar -d -o

