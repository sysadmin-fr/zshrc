# -*- shell-script -*-
# Prepare customs function

# My functions (don't forget to modify fpath before call compinit !!)
fpath=($ZSH_CONFIG_BASE/functions $fpath)

# register custom functions
autoload -U __set_title
autoload -U lsperm
autoload -U lsdir
autoload -U cd

return
