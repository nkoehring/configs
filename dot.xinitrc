xset -b
xrdb -merge .Xdefaults
xsetroot -solid black -cursor_name left_ptr
setxkbmap -layout us -variant alt-intl-unicode

synclient TapButton1=1
synclient TapButton2=2
synclient TapButton3=3
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient PalmDetect=1
synclient ClickPad=0
synclient CircularScrolling=0
syndaemon -Rtki 1 &       # disable touchpad while typing

redshift -l 52.3:13.3 &
[ -x ~/.fehbg ] && ~/.fehbg

dwm_bar &
exec dwm
