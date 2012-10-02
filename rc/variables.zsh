# -*- shell-script -*-
# Define special environment variables

# vi/vim
if [ -x $(which -p vim) ]; then 
	alias vi="vim"
	export EDITOR=vim
	export VISUAL=vim
else
	export EDITOR=vi
fi

# less
if [ -x $(which less) ]; then
	export PAGER=less
	export LESS="-ir"
	export LESSOPEN="| /usr/bin/lesspipe %s"
	export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

[ -d /usr/local/info ] && export INFO_PATH="$INFO_PATH;/usr/local/info"

PATH=$PATH:~/bin:/usr/local/bin

for tool in $HOME/tools/*(-/DN) ; do
	if [ -d $tool/bin ] ; then
		PATH=$PATH:$tool/bin
	fi
done
export PATH

# Remove '/' from included word chars
WORDCHARS="${WORDCHARS:s#/#}"
