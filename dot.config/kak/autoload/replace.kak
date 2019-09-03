define-command -hidden replace-insert -params 1 %{
  try %{
    execute-keys -draft ';<a-K>\n<ret>'
    execute-keys '<del>'
  }
}

define-command -hidden replace-delete -params 1 %{
  execute-keys '<space><a-;>H'
}

define-command replace -docstring 'Enter in replace mode' %{
  hook window InsertChar '[^\n]' -group replace %(replace-insert %val(hook_param))
  hook window InsertDelete '[^\n]' -group replace %(replace-delete %val(hook_param))
  hook -once window ModeChange insert:normal %{
    remove-hooks window replace
  }
  execute-keys -with-hooks i
}
