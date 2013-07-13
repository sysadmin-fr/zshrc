# -*- shell-script -*-
# Generic aliases

# I prefer interactive mode
alias mv="mv -iv"
alias rm="rm -iv"
alias cp="cp -iv"

# LS 
alias l='ls -l'
alias ll="ls -l"
alias la="ls -a"
alias lh="ls -lh"
alias lsd='ls -ld *(-/DN)'
alias df="df -h"

alias rsync="rsync -v --progress"

alias chmod="chmod --changes --preserve-root"
alias chown="chown --changes --preserve-root"

# zsh correct clea to flea
if [[ -x $(which flea) ]] alias clea="clear"

if [[ -x $(which vim) ]] alias vi="vim"

# start mutt with list mailboxes
if [[ -x $(which mutt) ]] alias mutt="mutt -y"

# Minicom (serial console rulez)
if [[ -x $(which minicom) ]] alias minicom="minicom -o" 

# IPv6 Stuff
alias netstat6="netstat -A inet6"

# Indent
if [[ -x $(which indent) ]] alias indent="indent -kr"

# acpi (show all available informations)
if [[ -x $(which acpi) ]] alias acpi="acpi -V"

# Etags
if [[ -x $(which etags) ]] alias etags="etags --members"

# rdesktop
if [[ -x $(which rdesktop) ]] alias rdesktop="rdesktop -u Administrator -a 8 -g 1024x768 -k fr"

# cron / fcronb
if [[ -x $(which fcron) ]] alias crontab="fcrontab"

# Parallel gzip
if [[ -z $(which pigz) ]] alias gzip=pigz

alias findnosecure="find / -perm +2000 -o -perm +4000 -print 2>/dev/null"

alias gnus='emacs -f gnus -nw'

# Suffixes aliases:
alias -s log="tail -f"		# tail log files
alias -s conf='$EDITOR'		# edit config files
alias -s ini='$EDITOR'		# edit config files
alias -s txt='$EDITOR'		# edit textes files

if [[ -x $(which colordiff) ]]; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

alias help='run-help'

# display certs info
alias -s pem="openssl x509 -text -noout -in"
alias -s req="openssl req -text -in"

alias date-rfc822="date '+%a, %d %b %Y %X %z'"

return
