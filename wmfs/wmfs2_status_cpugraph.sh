#!/bin/zsh

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

TIMING=1
red='#F92622'
orange='#FD971F'
yellow='#FDF71F'
green='#A6E22E'

statustext()
{
    cpu_value=$(cpu)
    cpu_color=$green
    test $cpu_value -gt 50 && cpu_color=$yellow
    test $cpu_value -gt 90 && cpu_color=$red

    mem_value=$(($(memu)*100/$(memt)))
    mem_color=$green
    test $mem_value -gt 50 && mem_color=$yellow
    test $mem_value -gt 90 && mem_color=$red

    wmfs -c status "default \
        ^g[960;0;100;12;$cpu_value;100;#000000;$cpu_color;cpugraph] \
        ^s[963;11;#000000;CPU $cpu_value%] \
        ^s[962;10;$cpu_color;CPU $cpu_value%] \
        ^g[1065;0;100;12;$mem_value;100;#000000;$mem_color;memgraph]
        ^s[1068;11;#000000;MEM $mem_value%] \
        ^s[1067;10;$mem_color;MEM $mem_value%]
    "
}

while true;
do
    statustext
    sleep $TIMING
done
