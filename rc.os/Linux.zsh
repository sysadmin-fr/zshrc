# -*- shell-script -*-
# OS Script: Linux
local cur=$(dirname $0)

# Generic GNU/Linux settings

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'

# Setup custom colors for files extensions
eval `dircolors $ZSH_CONFIG_BASE/misc/dircolors.rc`

# Use LS_COLORS for color completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Distrib specific
# Debian / Ubuntu
[ -r /etc/debian_version ] && source "$cur/Debian.zsh"

# Centos / Redhat
# [ -r ... ] && source "$cur/Redhat.zsh"

return
