# -*- shell-script -*-
# History setup

# options
unsetopt hist_beep            # Disable beeping
setopt hist_verify            # Verify history expansion
setopt extended_history       # add a timestamp and the duration of each command
setopt share_history          # _all_ zsh sessions share the same history files
setopt hist_ignore_all_dups   # ignores duplications
setopt hist_ignore_space      # Ignore command starting with a space (usefull with mc, security risk ?)
setopt hist_no_store          # Don't store calls to 'history' cmd
setopt hist_no_functions      # Don't store function definitions
setopt hist_reduce_blanks     # Remove superfluous blanks
setopt hist_fcntl_lock        # Allow file locking with fcntl()

if [[ $USER == "root" ]] unsetopt hist_ignore_space

# Variables
HISTFILE=$ZSH_DATA_BASE/histories/$HOST

local histdir=$(dirname $HISTFILE)
if [[ ! -d ${histdir} ]] mkdir -p ${histdir}

HISTSIZE=1000000
SAVEHIST=1000000

return
