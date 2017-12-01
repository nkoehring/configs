source /etc/profile

# Load profiles from ~/.config/profile.d
if test -d ~/.config/profile.d/; then
  for profile in ~/.config/profile.d/*.sh; do
    test -r "$profile" && . "$profile"
  done
  unset profile
fi


if [ `tty` = /dev/tty1 -a $USER != root -a ! -e /tmp/.X0-lock ]
then
  exec sway
fi
