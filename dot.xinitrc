setxkbmap de
xset -b

# synaptics touchpad (order is important here)
synclient RightButtonAreaLeft=4501
synclient RightButtonAreaRight=0
synclient RightButtonAreaTop=4100
synclient RightButtonAreaBottom=0
synclient MiddleButtonAreaRight=4500
synclient MiddleButtonAreaLeft=2500
synclient MiddleButtonAreaTop=4100
synclient MiddleButtonAreaBottom=0
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Profile" 2
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Constant Deceleration" 4
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Adaptive Deceleration" 4
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Velocity Scaling" 8

# syndaemon (disable touchpad while typing)
syndaemon -Rtki 1 &

# no eyestrain please
xflux -l 52.3 -g 13.3 -r 1

# sound
#exec start-pulseaudio-x11

exec herbstluftwm
