evaluate-commands %sh{
  plugins="$kak_config/plugins"
  mkdir -p "$plugins"
  [ ! -e "$plugins/plug.kak" ] && \
  git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
  printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload

###########################################################
# kakoune-buffers                                         #
# sets former b (word-back) to q and makes b a global key #
# for the new buffers command. I don't use macros anyway. #
###########################################################
plug 'delapouite/kakoune-buffers' config %{
  map global normal ^ q
  map global normal <a-^> Q
  map global normal q b
  map global normal Q B
  map global normal <a-q> <a-b>
  map global normal <a-Q> <a-B>
  map global normal b ': enter-buffers-mode<ret>' -docstring 'buffers'
  map global normal B ': enter-user-mode -lock buffers<ret>' -docstring 'buffers (lock)'
}

plug "andreyorst/kaktree" defer kaktree %{
  set-option global kaktree_double_click_duration '0.5'
  set-option global kaktree_indentation 1
  set-option global kaktree_dir_icon_open  '▾ 🗁 '
  set-option global kaktree_dir_icon_close '▸ 🗀 '
  set-option global kaktree_file_icon      '⠀⠀🖺'
  map global normal <F2> ': kaktree-toggle<ret>' -docstring 'toggle filetree'
} config %{
  hook global WinSetOption filetype=kaktree %{
    remove-highlighter buffer/numbers
    remove-highlighter buffer/matching
    remove-highlighter buffer/wrap
    remove-highlighter buffer/show-whitespaces
  }
  kaktree-enable
}

plug "ABuffSeagull/kakoune-vue"

plug "schemar/kak-jsts" config %{
  hook global WinSetOption filetype=(javascript|typescript|ecmascript) %{
    map window user l -docstring 'lint' ': lint<ret>'
    map window user f -docstring 'format' ': format-prettier<ret>'
    hook window BufWritePre .* %{
      evaluate-commands -no-hooks %{
        format-prettier
      }
    }
  }
}
