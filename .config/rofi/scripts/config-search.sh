#!/bin/bash

declare CONFIG=$HOME/.config

declare -a names=(
    "aliases"
    "kitty"
    "nvim"
    "rofi"
    "zsh"
)

declare -A options=(
    [aliases]=$CONFIG/zsh/zsh_aliases
    [kitty]=$CONFIG/kitty/kitty.conf
    [nvim]=$CONFIG/nvim/init.vim
    [rofi]=$CONFIG/rofi/config.rasi
    [zsh]=$HOME/.zshrc
)

for name in "${names[@]}"; do echo -en "$name\0icon\x1ftext-plain\n"; done

function openConfig() {
    coproc ( kitty nvim "$1" )
	kill -9 $(pgrep rofi)
}

[ ! -z $@ ] && openConfig "${options[$@]}"
