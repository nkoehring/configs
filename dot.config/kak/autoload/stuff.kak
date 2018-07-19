# hooks to show line numbers, whitespaces and matching brackets
hook -group DefaultHighlights global WinCreate .* %{
    add-highlighter window/ show_whitespaces
    add-highlighter window/ show_matching
    add-highlighter window/ regex '\h+$' 0:default,red    # show all trailing whispaces red
    add-highlighter window/ dynregex '%reg{/}' 0:+u 1:+b
    set-face window Whitespace rgb:555555+b
}

hook -group markdown-highlight global WinSetOption filetype=markdown %{
    add-highlighter window/ wrap -word -width 80
    add-highlighter window/ number_lines -hlcursor -separator '		'
}
hook global WinSetOption filetype=(?!markdown).* %{
    add-highlighter window/ number_lines -hlcursor -separator '  '
}

# map tmux split and window commands in vim style
def -file-completion -params 1 tabe %{ tmux-new-window edit %arg{1} }
def -file-completion -params 1 vsplit %{ tmux-new-vertical edit %arg{1} }
#map global insert ctrl-n '<esc>:new<ret>'
#map global normal ctrl-n ':new<ret>'

#def fedit -params 1 -shell-candidates %{ git ls-files } %{ edit %arg{1} }
#alias global fe fedit

def -docstring 'invoke fzf to open a file' \
  fzf-file %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo only works inside tmux
    else
      FILE=`fzf-tmux -d 15`
      if [ -n "$FILE" ]; then
        echo "eval -client '$kak_client' 'edit ${FILE}'" | kak -p ${kak_session}
      fi
    fi
}}

def -docstring 'invoke fzf to select a buffer' \
  fzf-buffer %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo only works inside tmux
    else
      BUFFER=`echo ${kak_buflist} | tr : '\n' | fzf-tmux -d 15`
      if [ -n "$BUFFER" ]; then
        echo "eval -client '$kak_client' 'buffer ${BUFFER}'" | kak -p ${kak_session}
      fi
    fi
}}

alias global ffe fzf-file
alias global ffb fzf-buffer

set global tabstop 2
set global indentwidth 2

hook global WinSetOption filetype=(javascript|ecmascript) %{
  set window formatcmd 'prettier-standard'
  #hook window BufWritePre .* format
}
hook global WinSetOption filetype=rust %{
  racer-enable-autocomplete
  set window formatcmd 'rustfmt'
  hook window BufWritePre .* format
  set buffer tabstop 4
  set buffer indentwidth 4
}
hook global WinSetOption filetype=json %{
  set window formatcmd 'jq .'
  hook window BufWritePre .* format
}
