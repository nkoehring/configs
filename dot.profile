source /etc/profile

export EDITOR=kak
export FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:darkening-parameters=500,300,1000,200,1500,100,2000,0 autofitter:warping=1"
export INFINALITY_FT_FILTER_PARAMS='10 35 40 35 10'
alias wttr="curl wttr.in"
alias ls="lsd"
alias l="lsd -lha"
alias ll="lsd -lh"
alias lt="lsd --tree"
alias pp="bat"

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
. "$HOME/.cargo/env"

export CARGO_HOME=$HOME/.cargo
export PNPM_HOME="$HOME/.local/share/pnpm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$HOME/.local/bin:$HOME/.yarn/bin:$PNPM_HOME:$GOPATH/bin:$CARGO_HOME/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man

TODO="$HOME/TODO/`date '+%Y%m%d'`.todo.txt"
if [ -f "$TODO" ]
then
  bat $TODO
fi
