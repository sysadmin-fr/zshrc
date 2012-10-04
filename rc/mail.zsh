# -*- shell-script -*-
# Start fetchmail automatically if configured

if [[ -x $(which fetchmail) && 
    ! -f ~/.fetchmail.pid &&
    ! -f /tmp/.${USER}.fetchmailnoask &&
      -r $HOME/.fetchmailrc ]]
then
    local ans
    echo -n "Start fetchmail ? [y/n] "
    read -q ans
    if [[ $ans == "y" ]]
    then
	fetchmail
    else
	echo -n "Ask again ? [y/n] "
	read -q ans
	if [[ $ans == "n" ]]
	then
	    # I use /tmp since it's purge every reboot
	    echo "" >| /tmp/.${USER}.fetchmailnoask
	fi
    fi
fi

return
