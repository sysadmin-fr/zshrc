# -*- shell-script -*-
# Define special environment variables

# Default text editor
if [[ -x $(which emacs) ]]; then 
	export EDITOR=emacs
	export VISUAL=emacs
else
	export EDITOR=vi
fi

# less
if [[ -x $(which less) ]]; then
	export PAGER=less
	export LESS="-iR"

        if [[ -x $(which lesspipe) ]]; then
            eval $($(which lesspipe))
        elif [[ -x $(which lesspipe.sh) ]]; then
            eval $($(which lesspipe.sh))
        fi

        # http://nion.modprobe.de/blog/archives/572-less-colors-for-man-pages.html
        export LESS_TERMCAP_mb=$'\E[01;31m'
        export LESS_TERMCAP_md=$'\E[01;31m'
        export LESS_TERMCAP_me=$'\E[0m'
        export LESS_TERMCAP_se=$'\E[0m'
        export LESS_TERMCAP_so=$'\E[01;44;33m'
        export LESS_TERMCAP_ue=$'\E[0m'
        export LESS_TERMCAP_us=$'\E[01;32m'
fi

if [[ -d /usr/local/info ]] export INFO_PATH="$INFO_PATH;/usr/local/info"

PATH=$PATH:~/bin:/usr/local/bin:/usr/sbin:/sbin:$HOME/.local/bin

for tool in $HOME/tools/*(-/DN) ; do
	if [[ -d $tool/bin ]] ; then
		PATH=$PATH:$tool/bin
	fi
done
export PATH

# Remove '/' from included word chars
WORDCHARS="${WORDCHARS:s#/#}"
WORDCHARS="${WORDCHARS:s#=#}"

# Go paths
GOBIN="${HOME}/.local/bin/"
GOPATH="${HOME}/.local/share/go:${HOME}/travail/devs/go/"
GOCACHE="${HOME}/.cache/go"
export GOBIN GOPATH GOCACHE

return
