# -*- shell-script -*-
# OS Script: SunOS

PATH=$HOME/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/ccs/bin:/usr/sfw/bin:/usr/openwin/bin:/usr/local/bin:/usr/local/sbin

MANPATH=/usr/man

# pkgsrc
if [ -d /usr/pkg ]; then
	PATH=$PATH:/usr/pkg/bin:/usr/pkg/sbin
	MANPATH=$MANPATH:/usr/pkg/man
fi

# blastwave
if [ -d /opt/csw ]; then
	PATH=$PATH:/opt/csw/bin:/opt/csw/sbin
	MANPATH=$MANPATH:/opt/csw/man
fi

export PATH MANPATH

local zonename=$(zonename)
if [[ $zonename == "global" ]]; then
    # Override ps output format
    alias ps='ps -efZ'
else
    # store zone name for prompt
    ps_instancename=$zonename
fi

# Check for gnuls
if [[ -x $(which gls) ]] ; then
	eval `gdircolors $HOME/.zsh/misc/dircolors.rc`
	alias ls='gls --color'
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

if [[ -x $(which gtar) ]] alias tar=gtar

## I know it's bad, but.. solaris terminfo sux
if [[ $TERM == "screen" && ! -f /usr/share/lib/terminfo/s/screen ]]; then
	export TERM=vt100
fi 

# Override TERM to VT100 before ssh if set to screen
ssh () {
    if [[ $TERM == "screen" ]] ; then
	TERM=vt100 command ssh $*
    else
	command ssh $*
    fi
}

return;
