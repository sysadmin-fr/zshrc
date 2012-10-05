# -*- shell-script -*-
# Démarrage d'un agent de gestion de clefs ssh si necessaire

# ssh key management
if [[ "$USER" != "root" && -z $SSH_AUTH_SOCK ]]; then
    autoload -U ssh_key_manage
    ssh_key_manage
fi

return
