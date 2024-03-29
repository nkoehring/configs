# koehr's zshell prompt
# zsh theme requires 256 color enabled terminal
# with ideas from sporty_256, fishy and cc (github:gabrielelana/dotfiles)

_collapsed_path() {
  #TODO: collapse path elements until the path is short enough
  #TODO  eg: "/foo/bar/baz/quux/quarz" becomes "/f/b/baz/quux/quarz" if it still fits
  #TODO  or "/f/b/b/q/quarz" in the 2nd shortest form, "quarz" in the shortest

  # http://lavica.fesb.hr/cgi-bin/info2html?(zsh)The%20zsh/pcre%20Module
  #echo $(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))

  PR_FILLBAR=""
  PR_PWDLEN=""
  PR_GIT="$(git_prompt_info)"
  
  local pwd=%~
  local promptsize=${#${(%):-(%n@%m)--}}
  local pwdsize=${#${(%):-%~}}
  local gitinfosize=${#${(%):-$PR_GIT}}

  if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
    pwd=$(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g")
    pwdsize=${#${(%):-$pwd}}
    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize - $gitinfosize))
    fi
  fi

  echo "%$PR_PWDLEN<...<%~%<<"
}


CC_RED='1'
CC_GREEN='2'
CC_LGRAY='250'
CC_GRAY='237'
CC_BLACK='232'
CC_WHITE='255'

CC_CPROMPT="%k%f%K{$CC_GRAY}%F{$CC_WHITE}"
CC_CRPROMPT="%k%f%K{$CC_GRAY}%F{$CC_WHITE}"
CC_CGITPROMPT="%k%f%K{$CC_GRAY}%F{$CC_LGRAY}"
CC_CWARN="%k%f%F{$CC_RED}"

CC_WRITE_IN_RED="%f%F{$CC_RED}"
CC_WRITE_IN_GREEN="%f%F{$CC_GREEN}"
CC_WRITE_IN_GRAY="%f%F{$CC_GRAY}"

CC_DRAW_IN_GRAY="%k%f%F{$CC_GRAY}"
CC_DRAW_IN_BLACK="%k%f%F{$CC_BLACK}"

CC_SYMBOL_RIGHT_ARROW=$'\ue0b0'
CC_SYMBOL_RIGHT_LIGHT_ARROW=$'\ue0b1'
CC_SYMBOL_LEFT_ARROW=$'\ue0b2'
CC_SYMBOL_LEFT_LIGHT_ARROW=$'\ue0b3'
CC_SYMBOL_RIGHT_BOXES=$'\ue0c6'
CC_SYMBOL_RIGHT_LIGHT_BOXES=$'\ue0c4'
CC_SYMBOL_LEFT_BOXES=$'\ue0c7'
CC_SYMBOL_LEFT_LIGHT_BOXES=$'\ue0c5'

CC_SYMBOL_HOME=$' \uf015 '
CC_SYMBOL_WORK=$' \uf0f7 '
CC_SYMBOL_SERVER=$' \uf233 '

ZSH_THEME_GIT_PROMPT_PREFIX="$CC_CGITPROMPT "
ZSH_THEME_GIT_PROMPT_SUFFIX=" $CC_DRAW_IN_BLACK"
ZSH_THEME_GIT_PROMPT_DIRTY="$CC_WRITE_IN_RED✗"
ZSH_THEME_GIT_PROMPT_CLEAN="$CC_WRITE_IN_GREEN✓"

CC_CURRENT_PATH="%1~"
CC_HOSTNAME=`hostname`

if [ "$CC_HOSTNAME" = 'koehr-main' ]; then
  CC_HOSTNAME=$CC_SYMBOL_SERVER
fi

if [ "$CC_HOSTNAME" = 'nkwd' ]; then
  CC_HOSTNAME=$CC_SYMBOL_HOME
fi

if [ "$CC_HOSTNAME" = 'phi' ]; then
  CC_HOSTNAME=$CC_SYMBOL_HOME
fi

RPROMPT="%k$CC_WRITE_IN_GRAY$CC_SYMBOL_LEFT_BOXES %K{$CC_GRAY}"'$(git_prompt_info)'"$CC_CRPROMPT $(_collapsed_path) %{$reset_color%}"
PROMPT="%(?.$CC_CPROMPT$CC_HOSTNAME .$CC_CWARN·%?·)%k$CC_WRITE_IN_GRAY$CC_SYMBOL_RIGHT_BOXES%f"'%{$reset_color%} ' #$CC_CURRENT_PATH "'$(git_prompt)'" $CC_DRAW_IN_GRAY$CC_SYMBOL_RIGHT_ARROW%f "
