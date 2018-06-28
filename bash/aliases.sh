#============================#
# Bash Aliases               #
#============================#

alias des='cd ~/Desktop'
alias dow='cd ~/Downloads'
alias dev='cd ~/Development'
alias doc='cd ~/Documents'
alias rec='cd ~/Records'
alias back='cd "$OLDPWD"'
function make_and_follow {
    mkdir $1
    cd $1
}
alias mkcd='make_and_follow'
function copy_and_follow {
    cp $1 $2
    cd $2
}
alias cpcd='copy_and_follow'
function move_and_follow {
    mv $1 $2
    cd $2
}
alias mvcd='move_and_follow'
function copy_to_home {
    cp "$@" "$HOME"
}
alias tohom='copy_to_home'
function copy_to_Desktop {
    cp "$@" "$HOME"/Desktop
}
alias todes='copy_to_Desktop'
function copy_to_Development {
    cp "$@" "$HOME"/Developments
}
alias todev='copy_to_Development'
function copy_to_Documents {
    cp "$@" "$HOME"/Documents
}
alias todoc='copy_to_Documents'
function copy_to_Records {
    cp "$@" "$HOME"/Records
}
alias torec='copy_to_Records'
function copy_from_Downloads {
    for arg in "$@"; do
        cp ~/Downloads/"$arg" "$PWD"
    done
}
alias frdow='copy_from_Downloads'
alias lsdow='ls ~/Downloads'

