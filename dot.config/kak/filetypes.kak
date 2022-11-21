hook -group markdown-highlight global WinSetOption filetype=markdown %{
    add-highlighter window/ wrap -word -width 80
    add-highlighter window/ number-lines -hlcursor -separator '		'
}
hook global WinSetOption filetype=(?!markdown).* %{
    add-highlighter window/ number-lines -hlcursor -separator '  '
}

hook global WinSetOption filetype=rust %{
  racer-enable-autocomplete
  set window formatcmd 'rustfmt'
  hook window BufWritePre .* format
  set buffer tabstop 4
  set buffer indentwidth 4
}
hook global WinSetOption filetype=json %{
  set window formatcmd 'jq --indent 2 .'
  hook window BufWritePre .* format
}
