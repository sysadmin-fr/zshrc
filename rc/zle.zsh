# -*- shell-script -*-
# Zshell line editing setup

# Use emacs bindkey
bindkey -e

# Use control-<left|right> arrows to move through words
bindkey '^[[1;5D' vi-backward-word
bindkey '^[[1;5C' vi-forward-word

bindkey '^U' backward-kill-line		# ctrl-U

return
