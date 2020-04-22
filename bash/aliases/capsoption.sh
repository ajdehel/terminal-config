# Relies on $CAPSOPTION in env.sh

alias capsoption='_capsoption'

function _capsoption {
    if [ -e "$(which setxkbmap)" ]; then
        setxkbmap -option caps:$CAPSOPTION &> /dev/null
    fi
}
