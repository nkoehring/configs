
_kitty() {
    local src
    # Send all words up to the word the cursor is currently on
    src=$(printf "%s
" "${(@)words[1,$CURRENT]}" | kitty +complete zsh)
    if [[ $? == 0 ]]; then
        eval ${src}
    fi
}
compdef _kitty kitty

