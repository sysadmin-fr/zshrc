# -*- shell-script -*-
# Defaults options

# Background/sub processes
setopt nohup                    # and don't kill them, either
setopt printexitvalue           # show the exit-value if > 0

setopt interactivecomments      # Allow comments even in interactive shells.


# Filename matching
setopt extended_glob            # in order to use #, ~ and ^ for filename generation

# Directory stask
setopt auto_cd                  # a commande like % /usr/local is equivalent to cd /usr/local
setopt auto_pushd               # automatically append dirs to the push/pop list
setopt pushd_minus              # Invert the behavior of cd -<tab> cd +<tab>
export DIRSTACKSIZE=20		# Number of directory to keep in the stack

setopt correct                  # try to correct the spelling if possible
setopt rmstarwait               # wait 10 seconds before querying for a rm which contains a *
setopt noclobber                # Don't erase file with >, use >| (overwrite) or >> (append) instead

# Set default umask to 027
umask 027

return
