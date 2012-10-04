# -*- shell-script -*-
# ZEN: ZSH Extended Network Scripts

if [[ -r $HOME/.zen ]] ; then
    fpath=($fpath $HOME/.zen/zsh/scripts $HOME/.zen/zsh/zle)
    autoload -U zen

    export PATH=$PATH:~/.zen/bin
    
    #zle -N insert-root-prefix
    autoload -U insert-root-prefix
    zle -N insert-root-prefix

    bindkey "^[f" insert-root-prefix
fi

return;
