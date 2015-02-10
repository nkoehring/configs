tags() {
    output=""

    for tag in $(herbstclient tag_status)
    do
        status=${tag:0:1}
        tag_id=${tag:1:1}
        case $status in
            '#')
                title=$(herbstclient attr clients.focus.title)
                [ "$title" = "" ] && title="$tag_id"
                [ ${#title} -ge 30 ] && title="${title:0:29}…"
                item="<fc=gray50>[</fc><fc=#ffee00>$title</fc><fc=gray50>]</fc>"
                ;;
            ':')
                item="<fc=gray50>[</fc><fc=#ee9a00>$tag_id</fc><fc=gray50>]</fc>"
                ;;
            '.')
                item="<fc=gray20>[$tag_id]</fc>"
                ;;
            *)
                item="<fc=gray50>[$tag_id]</fc>"
                ;;
        esac
        action="<action=`echo herbstclient use $tag_id`>$item</action>"
        output="$output$action"
    done

    echo $output
}

while true; do tags; sleep .5; done
