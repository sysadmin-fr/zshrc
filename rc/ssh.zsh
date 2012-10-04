# -*- shell-script -*-
# Démarrage d'un agent de gestion de clefs ssh si necessaire

# ssh key management
if [[ "$USER" != "root" ]]; then
    if [[ -z $GNOME_KEYRING_SOCKET ]]; then
	# pas d'agent gnome
	autoload -U ssh_key_manage
	ssh_key_manage
    fi
fi

return
