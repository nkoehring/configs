source /etc/profile

export EDITOR=kak
export GOPATH=$HOME/src/go
export ELMPATH=$HOME/src/pkg/Elm-Platform/0.18/.cabal-sandbox/bin
export PATH=$HOME/.local/bin:$GOPATH/bin:$ELMPATH:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man

export FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:darkening-parameters=500,300,1000,200,1500,100,2000,0 autofitter:warping=1"
export INFINALITY_FT_FILTER_PARAMS='10 35 40 35 10'

alias xi="sudo xbps-install"
alias xq="xbps-query -Rs"
alias xqi="xbps-query -RS"
alias xql="xbps-query -s"
alias xqf="xbps-query -f"
alias xqo="xbps-query -o"
alias xqre="xbps-query -R --regex -s"
alias howto="howdoi -c"

if [ `tty` = /dev/tty1 -a $USER != root -a ! -e /tmp/.X0-lock ]
then
  startx && exit
fi
