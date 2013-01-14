## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## redirect protection
unsetopt clobber

## pager
export PAGER="less"
export LESS="-R"
export EDITOR="vim"

export LC_CTYPE=$LANG
