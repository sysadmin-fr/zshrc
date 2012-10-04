# -*- shell-script -*-
# Defaults options

# precmd is called just before the prompt is printed
function title_precmd() {
    __set_title "zsh" "%m:%35<...<%~"
}

# preexec is called just before any command line is executed
function title_preexec() {
    __set_title "$1" "%m:%35<...<%~"
}

add-zsh-hook precmd title_precmd
add-zsh-hook preexec title_preexec

return
