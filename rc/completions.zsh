# -*- shell-script -*-
# Setup completion

# Options
setopt always_to_end            # move to cursor to the end after completion
setopt list_packed              # compact completion lists
setopt list_types               # show types in completion
setopt no_list_beep		# don't beep on ambiguous completions
setopt rec_exact                # recognise exact, ambiguous matches
setopt complete_in_word         # not just at the end

# Init required modules
# Colors setup
autoload -U colors
colors

# Complist module
zmodload zsh/complist

# Completion tweak:
zstyle ':completion:*' completer _complete _prefix _approximate
#zstyle ':completion:*' completer _complete _prefix _expand _approximate
#zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:complete:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
#zstyle ':completion:*:complete:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-,:=]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' menu yes=10 select=10-list interactive search	# Use interactive menu for 10+ matches
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' use-compctl false		# Ignore old style cmpletion
zstyle ':completion:*' use-ip true			# Don't filter ip-addresses from known-hosts
zstyle ':completion:*' use-cache on			# Use cache
zstyle ':completion:*' cache-path $ZSH_CACHE_BASE	# Cache path
zstyle ':completion:*' squeeze-slashes true		# Remove slash for directory
zstyle ':completion:*' group-name ''			# Group results
zstyle ':completion:*:descriptions' format '%B%d%b'	# Descriptions in bold

# Processes
zstyle ':completion:*:processes' list-colors '=(#b)( #[0-9]#)[^[/0-9a-zA-Z]#(*)=34=37;1=30;1'
zstyle ':completion:*:(killall|pkill|kill):*' menu yes select
zstyle ':completion:*:(killall|pkill|kill):*' force-list always
# Root has full process list by default
if [[ $USER == 'root' ]]; then
    # Root show all processes
    zstyle ':completion:*:processes' command ps --forest -A -o pid,cmd
else
    zstyle ':completion:*:processes' command ps --forest -a -o pid,cmd -u $USER
fi

zstyle ':completion:*:*:zless:*'	file-patterns '*(-/):directories *.gz:all-files'
zstyle ':completion:*:*:geeqie:*'	file-patterns '*(-/):directories :(#i)*.(png|jpeg|jpg):all-files'
zstyle ':completion:*:*:lintian:*'	file-patterns '*(-/):directories *.deb'
zstyle ':completion:*:*:evince:*'	file-patterns '*(-/):directories (#i)*.(pdf|ps)'

zstyle ':completion:*:cd:*'		ignored-patterns '(*/)#CVS'	# prevent CVS files/directory completion
zstyle ':completion:*:(all-|)files'	ignored-patterns '(|*/)CVS'
zstyle ':completion:*:*:less:*'		ignored-patterns '*.gz'
zstyle ':completion:*:*:zcompile:*'	ignored-patterns '(*~|*.zwc)'

# Some zstyle specific to editors
zstyle ':completion:*:*:(vi|vim|emacs):*' file-sort modification
zstyle ':completion:*:*:(vi|vim|emacs):*' ignored-patterns '*.(o|class)' '*~'

# Prevent aptitude-* to be complete, directly or via sudo
zstyle ':completion:*:complete:-command-::commands' ignored-patterns 'aptitude-*'
zstyle ':completion:*:*:sudo:*:commands' ignored-patterns 'aptitude-*'

# Group manpages by sections
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
#zstyle ':completion:*:man:*'	  group-name ''

autoload -Uz compinit
autoload -Uz complist
compinit -d $ZSH_CACHE_BASE/zcompdump

# few simple completion definitions
compdef _hosts mtr
compdef _hosts rdesktop
compdef _gnu_generic sort

return
