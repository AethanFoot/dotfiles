neofetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

ZSH_CACHE_DIR=$HOME/.cache/zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

## History
HISTFILE=$ZSH_CACHE_DIR/zsh_history
HISTSIZE=10000
SAVEHIST=10000

## Options section
setopt auto_pushd
setopt autocd
setopt extended_glob                                            # Extended globbing. Allows using regular expressions with *
setopt nocaseglob
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt nobeep                                                   # No beep
setopt append_history                                           # Immediately append history instead of overwriting
setopt extended_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups                                     # If a new command is a duplicate, remove the older one
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt pushd_ignore_dups
setopt pushd_minus

export EDITOR='nvim'
export VISUAL='code'
export BROWSER='brave'
export TERMINAL='kitty'
export COLORTERM='truecolor'
export __GL_THREADED_OPTIMIZATION=1
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH=/home/aethan/.cache/shader-cache

autoload -Uz compinit
compinit

WORDCHARS=${WORDCHARS//\/[&.;]}                                                            # Don't consider certain characters part of the word

# Basic auto/tab complete
zmodload zsh/complist
kitty + complete setup zsh | source /dev/stdin
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'        # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"                                    # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                         # automatically find new executables in path 
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'
zstyle '*' single-ignored show

autoload -U +X bashcompinit && bashcompinit

## Keybindings ##
bindkey -v
export KEYTIMEOUT=1

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ '${terminfo[khome]}' != '' ]]; then
  bindkey '${terminfo[khome]}' beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ '${terminfo[kend]}' != '' ]]; then
  bindkey '${terminfo[kend]}' end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias ##
. ~/.config/zsh/zsh_aliases

## Theming ##
autoload -U colors zcalc
colors

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aethan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aethan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aethan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aethan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Plugins ##
source ~/.config/zsh/zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait"0b" lucid atload"zmodload zsh/terminfo; \
bindkey '$terminfo[kcuu1]' history-substring-search-up; \
bindkey '$terminfo[kcud1]' history-substring-search-down; \
bindkey '^[[A' history-substring-search-up; \
bindkey '^[[B' history-substring-search-down"
zinit light zsh-users/zsh-history-substring-search

zinit ice wait"0b" lucid pick"init.sh" atload"export ENHANCD_DISABLE_HOME=1" blockf nocompletions
zinit light b4b4r07/enhancd

zinit wait"0c" lucid light-mode for \
    djui/alias-tips \
    hlissner/zsh-autopair

zinit wait"0a" lucid light-mode for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma/fast-syntax-highlighting \
 atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 blockf \
    zsh-users/zsh-completions
