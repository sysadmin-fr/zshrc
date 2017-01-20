# -*- shell-script -*-
# Define special environment variables

# Default text editor
export EDITOR=vi
export VISUAL=vi

# less
if [[ -x $(which less) ]]; then
	export PAGER=less
	export LESS="-ir"

        if [[ -x $(which lesspipe) ]]; then
            eval $($(which lesspipe))
        elif [[ -x $(which lesspipe.sh) ]]; then
            eval $($(which lesspipe.sh))
        fi
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

return
