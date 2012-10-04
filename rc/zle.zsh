# -*- shell-script -*-
# Zshell line editing setup

# Use emacs bindkey
bindkey -e

# Use control-<left|right> & alt-<left|right> arrows to move through words
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M emacs '^[[1;3D' backward-word
bindkey -M emacs '^[[1;3C' forward-word

# control|alt-del: delete current/next word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M emacs '^[[3;3~' kill-word
# control-backspace (need vt support): delete previous word
bindkey -M emacs '^H' backward-kill-word

bindkey "^[[5~" beginning-of-history	# PageUp
bindkey "^[[6~" end-of-history		# PageDown
bindkey "^[[Z" reverse-menu-complete	# Shift+Tab

bindkey '^U' backward-kill-line		# ctrl-U

# Search the history using already typed string
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

return
