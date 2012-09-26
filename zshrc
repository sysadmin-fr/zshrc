# My ZSH
# Main Configuration File


# Initialize XDG environment
${XDG_CONFIG_HOME=$HOME/.config}
${XDG_DATA_HOME=$HOME/.local/share}
${XDG_CACHE_HOME=$HOME/.cache}

# My functions (don't forget to modify fpath before call compinit !!)
fpath=($HOME/.zsh/functions $fpath)

