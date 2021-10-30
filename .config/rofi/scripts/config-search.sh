#!/bin/bash

CONFIG="$HOME/.config"

names=(
    "alacritty"
    "aliases"
    "doom config"
    "doom init"
    "doom packages"
    "nvim"
    "rofi"
    "zsh"
)

options=(
    "$CONFIG/alacritty/alacritty.yml"
    "$CONFIG/zsh/zsh_aliases"
    "$HOME/.doom.d/config.el"
    "$HOME/.doom.d/init.el"
    "$HOME/.doom.d/packages.el"
    "$CONFIG/nvim/init.vim"
    "$CONFIG/rofi/config.rasi"
    "$HOME/.zshrc"
)

for name in "${names[@]}"; do echo -en "$name\0icon\x1ftext-plain\n"; done

openConfig() {
    choice=""
    case "$1" in
        "alacritty" )
            choice=${options[0]}
            ;;
        "aliases" )
            choice=${options[1]}
            ;;
        "doom config" )
            choice=${options[2]}
            ;;
        "doom init" )
            choice=${options[3]}
            ;;
        "doom packages" )
            choice=${options[4]}
            ;;
        "nvim" )
            choice=${options[5]}
            ;;
        "rofi" )
            choice=${options[6]}
            ;;
        "zsh" )
            choice=${options[7]}
            ;;
        * )
            exit 0
            ;;
    esac

    coproc st -e nvim "$choice"
    kill -9 "$(pgrep rofi)"
}

[ -n "$*" ] && openConfig "$@"

exit 0
