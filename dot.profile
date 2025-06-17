source /etc/profile
source $HOME/.env # load secrets like API keys

export EDITOR=hx
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

nps () {
  NPS_TEMP=`mktemp`
  [[ "$1" ]] && NPS_SERVER="$1" || NPS_SERVER="nightfall.city" # poor mans ternary?
  $EDITOR $NPS_TEMP && echo '.' >> $NPS_TEMP && nc $NPS_SERVER 1915 < $NPS_TEMP
}

# randomize arguments, needs to be attached at the end of the argument list (eg type mplayer *.mp3 and press ctrl+s)
bindkey -s  '^S' '(oe:REPLY=\\$RANDOM:)'

if [[ "$TTY" == "/dev/tty"* ]]
then
  setfont drdos8x14
fi
. "$HOME/.cargo/env"

export CARGO_HOME=$HOME/.cargo
export PNPM_HOME="$HOME/.local/share/pnpm"
export DENO_INSTALL="$HOME/local/lib/deno"
export GOPATH="$HOME/pkg/go"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=$HOME/.local/bin:$DENO_INSTALL/bin:$HOME/.yarn/bin:$PNPM_HOME:$GOPATH/bin:$CARGO_HOME/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man

TODAY="`date '+%Y-%m-%d'`"
TODO="$HOME/TODO/`date '+%Y%m%d'`.todo.txt"
if [ -f "$TODO" ]
then
  bat $TODO
fi

TERMINAL_MULTIPLEXER=tmux # or zellij
MP_AUTO_ATTACH=true
MP_AUTO_EXIT=false

if [[ "$TERMINAL_MULTIPLEXER" == "zellij" ]]; then
  if [[ -z "$ZELLIJ" ]]; then
    if [[ "$MP_AUTO_ATTACH" == "true" ]]; then
      zellij attach -c
    else
      zellij
    fi

    if [[ "$MP_AUTO_EXIT" == "true" ]]; then
      exit
    fi
  fi
fi

if [[ "$TERMINAL_MULTIPLEXER" == "tmux" ]]; then
  if [[ -z "$TMUX" ]]; then
    if [[ "$MP_AUTO_ATTACH" == "true" ]]; then
      tmux attach || tmux
    else
      tmux
    fi

    if [[ "$MP_AUTO_EXIT" == "true" ]]; then
      exit
    fi
  fi
fi
