export QT_QPA_PLATFORMTHEME="qt5ct"
export STEAM_FRAME_FORCE_CLOSE=1
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin:$HOME/.emacs.d/bin"

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export BROWSER=/usr/bin/brave
export TERMINAL=/usr/bin/alacritty
export COLORTERM=truecolor
export MANPAGER="nvim -c 'set ft=man' -"

export __GL_THREADED_OPTIMIZATION=1
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH=/home/aethan/.cache/shader-cache

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
