#============================#
# Bash Prompt                #
#============================#

#| [-user-] /path (git-branch)
#| >>>
function multiline_prompt {
    prev_return=$1
    user=$(get_user)
    host=$(get_host)
    path=$(get_path)
    git_branch=$(get_git_branch)
    lead=$(get_lead $prev_return)
    PS1="\n$header_f[-$user@$host$header_f-] : $path $git_branch\n$lead$DEFAULT"
    PS2="        "
}

function get_user {
    user="$user_f$USER$DEFAULT"
    echo $user
}

function get_host {
    host="$host_f$(hostname)$DEFAULT"
    echo $host
}

function get_path {
    length=${#PWD}
    homeless=${PWD#~}
    home=${PWD%$homeless}
    if [[ "$home" = "$HOME" && "$homeless" != "" ]]; then
        path="~$homeless"
    else
        path="$PWD"
    fi
    base=${path##*/}
    baseless=${path%$base}
    if [[ $length -ge 40 ]]; then
        baseless=$(truncate_path $baseless 3)
    elif [[ $length -ge 80 ]]; then
        baseless=$(truncate_path $baseless 1)
    fi
    path="$path_f$baseless$base_f$base$DEFAULT"
    echo $path
}

function truncate_path {
    baseless=$1
    trunc_len=$2
    path_dirs=(${baseless//\// })
    baseless=""
    unset IFS
    for each in ${path_dirs[@]}; do
        each="${each:0:3}"
        baseless="$baseless$each/"
    done
    echo $baseless
}

function get_lead {
    prev_return=$1
    if [[ "$prev_return" -eq "0" ]]; then
        lead="$success_f >>> "
    else
        lead="$failure_f >>> "
    fi
    echo $lead
}

function get_git_branch {
    git_branch='$(git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /)'
    git_branch="$git_branch_f$git_branch$DEFAULT"
    echo $git_branch
}

function prompt {
    prev_rtrn=$?
    multiline_prompt $prev_rtrn $prompt_len
}

PROMPT_COMMAND=prompt
