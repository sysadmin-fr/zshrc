# -*- shell-script -*-
# Setup completion

# Options
export LISTPROMPT               # in order to scroll if completion list is too big
setopt always_to_end            # move to cursor to the end after completion

# Completion tweak:
zstyle ':completion:*' completer _complete _prefix _approximate
zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' use-ip true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $ZSH_CACHE_BASE	# Cache path

# Use 'ps -au$USER' for fetch user process list
zstyle ':completion:*:processes' command 'ps -au$USER'

# Verbose mode
zstyle ':completion:*:descriptions' format '%B%d%b'

# prevent CVS files/directory completion
if [[ -x $(which cvs) ]]
then
    zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
    zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
fi

zstyle ':completion:*:*:zless:*' file-patterns '*(-/):directories *.gz:all-files'
zstyle ':completion:*:*:gqview:*' file-patterns '*(-/):directories :(#i)*.(png|jpeg|jpg):all-files'
zstyle ':completion:*:*:lintian:*' file-patterns '*(-/):directories *.deb'
zstyle ':completion:*:*:evince:*' file-patterns '*(-/):directories (#i)*.(pdf|ps)'

zstyle ':completion:*:*:less:*' ignored-patterns '*.gz'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'

# Some zstyle specific to vi/vim
zstyle ':completion:*:*:vi*:*' file-sort modification
zstyle ':completion:*:*:vi*:*' ignored-patterns '*.(o|class)'

# Prevent aptitude-* to be complete, directly or via sudo
zstyle ':completion:*:complete:-command-::commands' ignored-patterns 'aptitude-*'
zstyle ':completion:*:*:sudo:*:commands' ignored-patterns 'aptitude-*'

autoload -Uz compinit
autoload -Uz complist
compinit -d $ZSH_CACHE_BASE/zcompdump

# few simple completion definitions
compdef _hosts mtr
compdef _hosts rdesktop
compdef _gnu_generic sort

local _extra_host_file
_extra_host_file=${XDG_DATA_HOME}/hosts.local/${HOST}

if [[ -f ${_extra_host_file} ]] ; then
		  local _local_hosts
		  _local_hosts=(${(f)"$(< $_extra_host_file)"})
		  zstyle ':completion:*:complete:*' hosts $_local_hosts
fi

return
