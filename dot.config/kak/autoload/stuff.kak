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
