#!/bin/sh

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}

tags() {
    output=""

    for tag in $(hc tag_status)
    do
        status=${tag:0:1}
        tag_id=${tag:1:1}
        case $status in
            '#')
                item="<fc=gray50>[</fc><fc=#ffee00>$tag_id</fc><fc=gray50>]</fc>"
                ;;
            ':')
                item="<fc=gray50>[</fc><fc=#ee9a00>$tag_id</fc><fc=gray50>]</fc>"
                ;;
            '.')
                item="<fc=gray20>[$tag_id]</fc>"
                ;;
            '*')
                item="<fc=gray50>[</fc><fc=gray50>$tag_id</fc><fc=gray50>]</fc>"
                ;;
        esac
        action="<action=`echo herbstclient use $tag_id`>$item</action>"
        output="$output$action"
    done

    echo $output
}

panel_height=48

for monitor in $(hc list_monitors | cut -d: -f1)
do
    hc pad $monitor $panel_height
done

sh ~/.config/herbstluftwm/tag_status.sh | xmobar -d -o

