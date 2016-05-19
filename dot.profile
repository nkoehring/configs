source /etc/profile

export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man
export QT_DEVICE_PIXEL_RATIO=2

#export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
#export NVIM_TUI_ENABLE_TRUE_COLOR=1

alias xi="sudo xbps-install"
alias xq="xbps-query -Rs"
alias xqi="xbps-query -RS"
alias xql="xbps-query -s"

test "$TERM" = "screen" && export TERM=screen-256color
test `tty` = /dev/tty1 -a $USER != root -a ! -e /tmp/.X0-lock && startx && exit
