# Installation

    $ mkdir -p $HOME/.config/zsh
    $ git clone https://github.com/sysadmin-fr/zshrc $HOME/.config/zsh
    $ ln -s $HOME/.config/zsh/zshrc $HOME/.zshrc
    $ zsh

# Prompt customisation

You can create a file in $HOME/.config/zsh/rc.host/${hostname}.zsh to have machine specific customizations (for example
prompt colors with a shared HOME).

    zstyle  :prompt:asyd user-color green
    zstyle  :prompt:asyd host-color green
    zstyle  :prompt:asyd path-color green

# Features

* Completion cache is enabled by defaults

# Extra hosts file

You can create a file `${XDG_DATA_HOME}/hosts.local/${HOST}` with one host per line.
