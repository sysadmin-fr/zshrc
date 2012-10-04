# -*- shell-script -*-
# History setup

# options
setopt hist_verify            # Verify history expansion
setopt extended_history       # add a timestamp and the duration of each command
setopt share_history          # _all_ zsh sessions share the same history files
setopt hist_ignore_all_dups   # ignores duplications

# Variables
HISTFILE=$ZSH_DATA_BASE/histories/$(hostname)

local histdir=$(dirname $HISTFILE)
if [[ ! -d ${histdir} ]] mkdir -p ${histdir}

HISTSIZE=1000000
SAVEHIST=1000000

return
