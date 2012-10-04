# -*- shell-script -*-
# VCS info setup
# Configure vcs_info display

# prepare functions
autoload -Uz vcs_info

# Check the repository for changes so they can be used in %u/%c (see
# below). This comes with a speed penalty for bigger repositories.
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' enable git cvs svn bzr hg

# Only run vcs_info when necessary to speed up the prompt
# Extracted from vcs_info examples.
FORCE_RUN_VCS_INFO=1

zstyle ':vcs_info:*+pre-get-data:*' hooks pre-get-data
+vi-pre-get-data() {
    # Only Git and Mercurial support and need caching. Abort if any other
    # VCS is used.
    [[ "$vcs" != git && "$vcs" != hg ]] && return

    # If the shell just started up or we changed directories (or for other
    # custom reasons) we must run vcs_info.
    if [[ -n $FORCE_RUN_VCS_INFO ]]; then
        FORCE_RUN_VCS_INFO=
        return
    fi

    # If we got to this point, running vcs_info was not forced, so now we
    # default to not running it and selectively choose when we want to run
    # it (ret=1 means abort processing).
    ret=1
    # If a git/hg command was run then run vcs_info as the status might
    # need to be updated.
    case "$(fc -ln $(($HISTCMD-1)))" in
        git*)
            ret=0
            ;;
        hg*)
            ret=0
            ;;
    esac
}

# Call vcs_info as precmd before every prompt.
vcs_precmd() {
    vcs_info 'prompt'
}
add-zsh-hook precmd vcs_precmd

# Must run vcs_info when changing directories.
vcs_chpwd() {
    FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd vcs_chpwd

### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
+vi-git-untracked(){
    # Only one run per prompt
    [[ $user_data[git-untracked] == 1 ]] && return
    user_data[git-untracked]=1

    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='T'
    fi
}


### Compare local changes to remote changes

### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # Only one run per prompt
    [[ $user_data[git-st] == 1 ]] && return
    user_data[git-st]=1

    # for git prior to 1.7
    #ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    # need to track upstream branch with:
    # git branch --set-upstream foo origin/foo
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "+${ahead}" )

    # for git prior to 1.7
    #behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "-${behind}" )

    hook_com[misc]+=${(j:/:)gitstatus}
}

### git: Show remote branch name for remote-tracking branches
# function +vi-git-remotebranch() {
#     local remote

#     # Are we on a remote-tracking branch?
#     remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
#         --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

#     # The first test will show a tracking branch whenever there is one. The
#      # second test, however, will only show the remote branch's name if it
#     # differs from the local one.
#     if [[ -n ${remote} ]] ; then
#     #if [[ -n ${remote} && ${remote#*/} != ${hook_com[branch]} ]] ; then
#         hook_com[branch]="${hook_com[branch]} [${remote}]"
#     fi
# }

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st
# git-remotebranch

return
