# pSy's zshell prompt
# zsh theme requires 256 color enabled terminal
# based on sporty_256 and fishy

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


RPROMPT='$(git_prompt_info) %F{208}$(_collapsed_path)%f%{$reset_color%}'
PROMPT='%(?..%F{124}·%?·)%F{208}%n%f%{$fg[white]%}@%F{039}%m%f%{$reset_color%} %{$fg[white]%}%# %{$reset_color%}'

#ZSH_THEME_GIT_PROMPT_PREFIX="%F{154}±|%f%F{124}"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{154}%f%F{124}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%B✘%b%F{154}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%F{154}"

#TODO: think about a nicer usage of these…
#ZSH_THEME_GIT_PROMPT_PREFIX=" "
#ZSH_THEME_GIT_PROMPT_SUFFIX=""
#ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#
#ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
