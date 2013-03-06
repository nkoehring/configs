#!/bin/sh

#source .zsh/env
xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell
#xrdb -merge $HOME/.Xresources
#xmodmap ~/.Xmodmap
#setxkbmap -layout de -option ctrl:nocaps

# deactivate touchpad tapping when typing
syndaemon -t -k -i 1 -d &

# preload programs
hash firefox conky && #firefox &
conky -b -d -c $HOME/.conkyrc &
#sh ~/.fehbg &


memu(){
    memu="$(free -m | sed -n 's|^-.*:[ \t]*\([0-9]*\) .*|\1|gp')"
    echo "$memu"
}
memt(){
    memt="$(free -m | sed -n 's|^M.*:[ \t]*\([0-9]*\) .*|\1|gp')"
    echo "$memt"
}
cpu(){
    cpu="$(eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4;
	      eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat);
	      intervaltotal=$((total-${prevtotal:-0}));
	      echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")"
    echo "$cpu" 
}


while true
do
	LOCALTIME=$(date '+%Y-%m-%d %H:%M')
	#IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
    IPs=$(ip r list scope link proto kernel | awk '{print $3 ":" $5}')
    IP=$(for x in $IPs; do echo -n $x" "; done)
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
    CPU=$(cpu)
    MEM=$(($(memu)*100/$(memt)))

	if acpi -a | grep off-line > /dev/null
	then
		BAT="\\$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')/"
	else
        if acpi -a | grep Full > /dev/null
        then
            BAT=""
        else
            BAT="/$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')\\"
        fi
	fi
    xsetroot -name "$IP| CPU:$CPU% | MEM:$MEM% | $BAT | $TEMP | $LOCALTIME"
	sleep 5s
done &

xbindkeys
sh ~/.fehbg
mkdir -p .cache/dwm/
while true; do
  dwm 2> ~/.cache/dwm/err
done
