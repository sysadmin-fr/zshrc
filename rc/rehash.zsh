# -*- shell-script -*-
# Rehash of command cache

# Rehash every five minutes
periodic () {
 rehash
}
export PERIOD=300

# Rehash on failed completion:
function compctl_rehash { rehash; reply=() }
compctl -C -c + -K compctl_rehash + -c

# Or rehash on each completion:
#compctl -C -K cmd-comp -c
#function cmd-comp {
#	rehash
#}

return;
