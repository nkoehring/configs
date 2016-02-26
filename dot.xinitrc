setxkbmap de
xset -b

synclient RightButtonAreaLeft=4501
synclient RightButtonAreaRight=0
synclient RightButtonAreaTop=4100
synclient RightButtonAreaBottom=0
synclient MiddleButtonAreaLeft=2500
synclient MiddleButtonAreaRight=4500
synclient MiddleButtonAreaTop=410
synclient MiddleButtonAreaBottom=0

syndaemon -Rtki 1 &       # disable touchpad while typing
redshift -l 52.3:13.3 &   # no eyestrain please
[ -x ~/.fehbg ] && ~/.fehbg
compton --config ~/.config/comptonrc -b
exec sxhkd &              # shortcuts
exec panel &              # panel
exec bspwm
