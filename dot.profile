source /etc/profile

export EDITOR=kak
export GOPATH=$HOME/src/go
export CARGO_HOME=$HOME/.cargo
export PATH=$HOME/.local/bin:$HOME/.local/share/npm-global/bin:$GOPATH/bin:$CARGO_HOME/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man

export _JAVA_AWT_WM_NONREPARENTING=1
export FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:darkening-parameters=500,300,1000,200,1500,100,2000,0 autofitter:warping=1"
export INFINALITY_FT_FILTER_PARAMS='10 35 40 35 10'

export LD_LIBRARY_PATH=$HOME/.local/lib:$HOME/.local/lib/haxe:/lib

alias xi="sudo xbps-install"
alias xq="xbps-query -Rs"
alias xqi="xbps-query -RS"
alias xql="xbps-query -s"
alias xqf="xbps-query -f"
alias xqo="xbps-query -o"
alias xqre="xbps-query -R --regex -s"
alias howto="howdoi -c"
alias icat="kitty +kitten icat"
alias wttr="curl wttr.in"

short_url () {
  curl -F "shorten=$1" https://0x0.st
}

share_file () {
  curl -F "file=@$1" https://0x0.st
}

if [[ "$TTY" == "/dev/tty"* ]]
then
  setfont drdos8x14
fi

if [ "$TTY" = /dev/tty1 -a $USER != root -a ! -e /tmp/.X0-lock ]
then
  startx && clear && exit
fi
