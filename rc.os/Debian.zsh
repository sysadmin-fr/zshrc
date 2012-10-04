# -*- shell-script -*-
# Debian specific parts

# Setup debian upgrade function
autoload -U __debian_upgrade
alias upgrade=__debian_upgrade
compdef _hosts __debian_upgrade

# Add name of (Debian) SCHROOT if exists
[ -r /etc/debian_chroot ] && instancename=${$(< /etc/debian_chroot)//-*}

return;
