declare-option -hidden str explore_buffers_current

set-face global ExploreBuffers 'yellow,default'

add-highlighter shared/buffers regions
add-highlighter shared/buffers/content default-region group
add-highlighter shared/buffers/content/buffers regex '^.+$' 0:ExploreBuffers

define-command -hidden explore-buffers -docstring 'Explore buffers' %{ evaluate-commands -save-regs '"/' %{
  set-option current explore_buffers_current %val(bufname)
  edit! -scratch *buffers*
  set-option buffer filetype buffers
  evaluate-commands set-register dquote %val(buflist)
  execute-keys '<a-R>)<a-space>i<ret><esc><space>'
  set-register / "\Q%opt(explore_buffers_current)\E"
  execute-keys n
}}

define-command -hidden explore-buffers-parent -docstring 'Explore the parent directory of the selected buffer' %{
  explore-buffers-validate
  explore-files %sh(dirname "$kak_buffile")
}

define-command -hidden explore-buffers-validate -docstring 'Edit selected buffer' %{
  execute-keys '<space><a-x>_'
  buffer %reg(.)
  delete-buffer *buffers*
}

define-command -hidden explore-buffers-delete -docstring 'Delete selected buffer' %{
  execute-keys '<space><a-x>_'
  delete-buffer %reg(.)
  explore-buffers
}

hook global WinSetOption filetype=buffers %{
  add-highlighter window/ ref buffers
  map window normal <ret> ': explore-buffers-validate<ret>'
  map window normal <backspace> ': explore-buffers-parent<ret>'
  map window normal q ': delete-buffer<ret>'
  map window normal <esc> ': delete-buffer<ret>'
  map window normal d ': explore-buffers-delete<ret>'
  hook -always -once window WinSetOption filetype=.* %{
    remove-highlighter window/buffers
  }
}

define-command -hidden explore-buffers-enable %{
  hook window -group explore-buffers RuntimeError '\d+:\d+: ''(buffer|b)'' wrong argument count' %{
    # Hide error message
    echo
    explore-buffers
  }
}

hook -group explore-buffers global WinCreate .* %{
  explore-buffers-enable
}
