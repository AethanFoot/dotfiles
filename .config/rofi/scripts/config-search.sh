#!/bin/bash

CONFIG="$HOME/.config"

names=(
    "aliases"
    "kitty"
    "nvim"
    "rofi"
    "zsh"
)

options=(
    "$CONFIG/zsh/zsh_aliases"
    "$CONFIG/kitty/kitty.conf"
    "$CONFIG/nvim/init.vim"
    "$CONFIG/rofi/config.rasi"
    "$HOME/.zshrc"
)

for name in "${names[@]}"; do echo -en "$name\0icon\x1ftext-plain\n"; done

openConfig() {
    choice=""
    case "$1" in
        "aliases" )
            choice=${options[0]}
            ;;
        "kitty" )
            choice=${options[1]}
            ;;
        "nvim" )
            choice=${options[2]}
            ;;
        "rofi" )
            choice=${options[3]}
            ;;
        "zsh" )
            choice=${options[4]}
            ;;
        * )
            exit 0
            ;;
    esac

    coproc kitty nvim "$choice"
    kill -9 "$(pgrep rofi)"
}

[ -n "$*" ] && openConfig "$@"

exit 0
