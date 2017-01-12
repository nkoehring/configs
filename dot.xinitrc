setxkbmap de
xset -b
xrdb -merge .Xdefaults
xsetroot -solid black -cursor_name left_ptr

synclient TapButton1=1
synclient TapButton2=2
synclient TapButton3=3
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient PalmDetect=1
synclient ClickPad=0
synclient CircularScrolling=0
syndaemon -Rtki 1 &       # disable touchpad while typing
xcalib -d :0 ~/.config/icc/natural.icm
redshift -l 52.3:13.3 &   # no eyestrain please
[ -x ~/.fehbg ] && ~/.fehbg
autocutsel -f &
autocutsel -selection PRIMARY -fork &
compton --config ~/.config/comptonrc -b
exec i3
