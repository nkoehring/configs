source /etc/profile

export QT_QPA_PLATFORM=wayland-egl
export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=Unity

export XMODIFIERS=@im=ibus
export EDITOR=kak
export GOPATH=$HOME/src/go
export ELMPATH=$HOME/src/pkg/Elm-Platform/0.18/.cabal-sandbox/bin
export CARGO_HOME=$HOME/.cargo
export PATH=$HOME/.local/bin:$HOME/.local/share/npm-global/bin:$GOPATH/bin:$ELMPATH:$CARGO_HOME/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man

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
alias wttr="wego"

short_url () {
  curl -F "shorten=$1" https://0x0.st
}

share_file () {
  curl -F "file=@$1" https://0x0.st
}

if [[ "$TTY" == "/dev/tty"* ]]
then
  setfont /home/nk/.local/share/fonts/spleen-16x32.psfu
fi

if [ "$TTY" = /dev/tty1 -a $USER != root -a ! -e /tmp/.X0-lock ]
then
  .local/bin/sway
fi
