# -*- shell-script -*-
# My ZSH Main Configuration File

# Initialize XDG environment
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME XDG_DATA_HOME XDG_CACHE_HOME

# Private variables:
# Base directory for configuration files
ZSH_CONFIG_BASE=$XDG_CONFIG_HOME/zsh/
# Histories, user datas..
ZSH_DATA_BASE=$XDG_DATA_HOME/zsh/
if [[ ! -d $ZSH_DATA_BASE ]] mkdir -p $ZSH_DATA_BASE

# caches, (compiled functions ?), ..
ZSH_CACHE_BASE=$XDG_CACHE_HOME/zsh/
if [[ ! -d $ZSH_CACHE_BASE ]] mkdir -p $ZSH_CACHE_BASE

# Global resource files
for file in $ZSH_CONFIG_BASE/rc/*.zsh; do
    source $file
done

# per OS resource file
os=$(uname)
if [[ -f $ZSH_CONFIG_BASE/rc.os/${os}.zsh ]] source $ZSH_CONFIG_BASE/rc.os/${os}.zsh

# per host resource file
host=${$(hostname)//.*/}
if [[ -f $ZSH_CONFIG_BASE/rc.host/${host}.zsh ]] source $ZSH_CONFIG_BASE/rc.host/${host}.zsh

# Local file
if [[ -f $ZSH_CONFIG_BASE/rc.local ]] source $ZSH_CONFIG_BASE/rc.local

