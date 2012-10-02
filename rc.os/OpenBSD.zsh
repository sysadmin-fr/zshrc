# -*- shell-script -*-
# OS Script: OpenBSD

# Check for GNULS
if [ -x $(which gls) ] ; then
    eval `gdircolors $ZSH_CONFIG_BASE/misc/dircolors.rc`
    alias ls='gls --color'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi