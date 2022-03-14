source /etc/profile

export EDITOR=kak
export GOPATH=$HOME/src/go
export CARGO_HOME=$HOME/.cargo
export PATH=$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.local/share/npm-global/bin:$GOPATH/bin:$CARGO_HOME/bin:$HOME/.gem/ruby/2.7.0/bin:$PATH
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
# alias df="duf"
# alias du="dust"
alias md="glow -p"
alias ls="lsd"
alias l="lsd -lha"
alias ll="lsd -lh"
alias lt="lsd --tree"
alias pp="bat"
alias feh="feh --auto-rotate --draw-actions --draw-exif --draw-filename --draw-tinted"

# twtxt
alias ttt="txtnish tweet"
alias ttl="txtnish timeline"
alias ttf="txtnish follow"
alias ttu="txtnish unfollow"
alias ttr="txtnish reply"

alias rip="curl -G -H 'Accept: text/plain' --url https://dontbeevil.rip/search --data-urlencode "

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
