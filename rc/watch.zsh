# -*- shell-script -*-
# Watch login / logout

LOGCHECK=300                        # check every 5 min for login/logout activity
watch=(all)                         # watch for everybody
#watch=( $(<~/.friends) )           # watch for people in .friends file
#watch=(notme)                      # watch for everybody but me
WATCHFMT='%n %a %l from %m at %T.'  # Add time to watch msg

return
