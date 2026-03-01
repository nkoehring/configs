source /etc/profile
source $HOME/.env # load secrets like API keys

export EDITOR=hx
export FREETYPE_PROPERTIES="truetype:interpreter-version=35 cff:darkening-parameters=500,300,1000,200,1500,100,2000,0 autofitter:warping=1"
export INFINALITY_FT_FILTER_PARAMS='10 35 40 35 10'

# set bitwarden as SSH key source
# export SSH_AUTH_SOCK=/var/home/n/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock

# Homebrew for Linux?
# export LIBRARY_PATH=/home/linuxbrew/.linuxbrew/lib:/lib64
# export LD_LIBRARY_PATH=/home/linuxbrew/.linuxbrew/lib:/lib64

# seems disfunctional :/
alias wttr="curl wttr.in"

# https://github.com/eza-community/eza
alias ls="eza"
alias l="eza -lha"
alias ll="eza -lh"
alias lt="eza --tree"
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

# Package managers for Rust, JavaScript, Go ... all the stuff
. "$HOME/.cargo/env"
export CARGO_HOME=$HOME/.cargo
export PNPM_HOME="$HOME/.local/share/pnpm"
export DENO_INSTALL="$HOME/local/lib/deno"
export BUN_INSTALL="$HOME/.bun"
export GOPATH="$HOME/pkg/go"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

export PATH=$HOME/.local/bin:$BUN_INSTALL/bin:$DENO_INSTALL/bin:$HOME/.yarn/bin:$PNPM_HOME:$GOPATH/bin:$CARGO_HOME/bin:$PATH

export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man

#TODO: this should be a function
TODAY="`date '+%Y-%m-%d'`"
TODO="$HOME/TODO/`date '+%Y%m%d'`.todo.txt"
if [ -f "$TODO" ]
then
  bat $TODO
fi

TERMINAL_MULTIPLEXER=none # tmux, zellij
MP_AUTO_ATTACH=false
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
