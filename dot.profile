source /etc/profile

export EDITOR=kak
export GOPATH=$HOME/src/go
export PATH=$HOME/.local/bin:$GOPATH/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man
export QT_SCALE_FACTOR=2

export FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:darkening-parameters=500,300,1000,200,1500,100,2000,0 autofitter:warping=1"
export INFINALITY_FT_FILTER_PARAMS='10 35 40 35 10'

alias xi="sudo xbps-install"
alias xq="xbps-query -Rs"
alias xqi="xbps-query -RS"
alias xql="xbps-query -s"
alias xqf="xbps-query -f"
alias howto="howdoi -c"

if [ `tty` = /dev/tty1 -a $USER != root -a ! -e /tmp/.X0-lock ]
then
  tmux new-session -d -s work -c ~/src/fromAtoB
  tmux new-session -d -s stuff -c ~
  startx && exit
fi
