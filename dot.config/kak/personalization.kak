colorscheme penumbra
set-option global scrolloff 5,5
set-option global incsearch true
set-option global aligntab true
set-option global ui_options terminal_assistant=dilbert
set-option -add global ui_options terminal_change_colors=true
set-option global grepcmd 'rg --with-filename --line-number --column'
set-option global tabstop 2
set-option global indentwidth 2

# hooks to show line numbers, whitespaces and matching brackets
hook -group DefaultHighlights global WinCreate .* %{
    add-highlighter window/ show-whitespaces
    add-highlighter window/ show-matching
    add-highlighter window/ regex '\h+$' 0:default,red # highlight trailing whitepaces
    add-highlighter window/ dynregex '%reg{/}' 0:+u 1:+b
    set-face window Whitespace rgb:555555+b
}

# with inspiration from
# https://github.com/Delapouite/dotfiles/blob/master/link/kak/kakrc
set global modelinefmt %{
  %val{bufname} [%opt{filetype}]
· %val{cursor_line}:%val{cursor_char_column}
· {{context_info}} {{mode_info}}
}

# spaces instead tabs
hook global InsertChar \t %{ try %{
  execute-keys -draft "h<a-h><a-k>\A\h+\z<ret><a-;>;%opt{indentwidth}@"
}}
hook global InsertDelete ' ' %{ try %{
  execute-keys -draft 'h<a-h><a-k>\A\h+\z<ret>i<space><esc><lt>'
}}

# Bring back S-x (kind of)
map global normal X 'Jx'

# editorconfig support
hook global BufCreate .* %{editorconfig-load}

# kak-lsp
eval %sh{kak-lsp --kakoune -s $kak_session}  # Not needed if you load it with plug.kak.
hook global WinSetOption filetype=(rust|html|css|svelte|javascript|typescript|c|cpp) %{
  lsp-enable-window
  lsp-auto-hover-enable
  lsp-auto-signature-help-enable
  set-option global lsp_hover_anchor true
  map global user l ': enter-user-mode lsp<ret>' -docstring 'lsp'
}

# theme config for kak-lsp info box
face global InfoDefault               Information
face global InfoBlock                 Information
face global InfoBlockQuote            Information
face global InfoBullet                Information
face global InfoHeader                Information
face global InfoLink                  Information
face global InfoLinkMono              Information
face global InfoMono                  Information
face global InfoRule                  Information
face global InfoDiagnosticError       Information
face global InfoDiagnosticHint        Information
face global InfoDiagnosticInformation Information
face global InfoDiagnosticWarning     Information


# Show various characters
# https://unicode-table.com
add-highlighter -override global/U+2013 regex '–' '0:green+f'
add-highlighter -override global/U+2014 regex '—' '0:green+bf'
add-highlighter -override global/math-symbols regex '[−×]' '0:cyan+f'

# Show the Unicode value under the cursor.
map -docstring 'Unicode' global user u ': echo -markup "{Information}U+%sh{printf ''%04x'' ""$kak_cursor_char_value""}"<ret>'
