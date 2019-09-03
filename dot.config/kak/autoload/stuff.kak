# hooks to show line numbers, whitespaces and matching brackets
hook -group DefaultHighlights global WinCreate .* %{
    add-highlighter window/ show-whitespaces
    add-highlighter window/ show-matching
    add-highlighter window/ regex '\h+$' 0:default,red # highlight trailing whitepaces
    add-highlighter window/ dynregex '%reg{/}' 0:+u 1:+b
    set-face window Whitespace rgb:555555+b
}

hook -group markdown-highlight global WinSetOption filetype=markdown %{
    add-highlighter window/ wrap -word -width 80
    add-highlighter window/ number-lines -hlcursor -separator '		'
}
hook global WinSetOption filetype=(?!markdown).* %{
    add-highlighter window/ number-lines -hlcursor -separator '  '
}

# map tmux split and window commands in vim style
def -file-completion -params 1 tabe %{ tmux-terminal-window edit %arg{1} }
def -file-completion -params 1 vsplit %{ tmux-terminal-vertical edit %arg{1} }
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


#########################################################
# buffers (https://github.com/Delapouite/kakoune-buffers)
#
# sets former b (word-back) to q and makes b a global key
# for the new buffers command. I don't use macros anyway.
#########################################################

hook global WinDisplay .* info-buffers

# ciao macros
map global normal ^ q
map global normal <a-^> Q
map global normal q b
map global normal Q B
map global normal <a-q> <a-b>
map global normal <a-Q> <a-B>

map global normal b ':enter-buffers-mode<ret>'              -docstring 'buffers…'
map global normal B ':enter-user-mode -lock buffers<ret>'   -docstring 'buffers (lock)…'


#############################################
# lsp support (https://github.com/ul/kak-lsp)
# ...but it's not working yet
#############################################

# eval %sh{kak-lsp --kakoune -s $kak_session}
# 
# set-option global lsp_completion_trigger "execute-keys 'h<a-h><a-k>\S[^\h\n,=;*(){}\[\]]\z<ret>'"
# set-option global lsp_diagnostic_line_error_sign "!"
# set-option global lsp_diagnostic_line_warning_sign "?"
# 
# hook global WinSetOption filetype=(c|cpp|rust|javascript|html|css|json) %{
#   map window user "l" ": enter-user-mode lsp<ret>" -docstring "LSP mode"
#   lsp-enable-window
#   lsp-auto-hover-enable
#   lsp-auto-hover-insert-mode-disable
#   set-option window lsp_hover_anchor true
#   set-face window DiagnosticError default+u
#   set-face window DiagnosticWarning default+u
#}
#hook global WinSetOption filetype=rust %{
#  set-option window lsp_server_configuration rust.clippy_preference="on"
#}
#hook global KakEnd .* lsp-exit


##########################################################
# replace mode (https://github.com/alexherbo2/replace.kak)
# that is one thing I missed in Kakoune: writing over text
##########################################################
map global user r -docstring 'Replace' ': replace<ret>'

###########################################################
# explore files (https://github.com/alexherbo2/explore.kak)
# use fd instead of find
###########################################################
define-command -hidden -override explore-files-recursive -params 0..1 %{
  explore-files-display "fd %sh(test $kak_opt_explore_files_show_hidden = true && echo --hidden)" %arg(1)
}
