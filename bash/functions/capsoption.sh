export CAPSOPTION="escape"

function capsoption {
    if [ -e "$(which setxkbmap)" ]; then
        setxkbmap -option caps:$CAPSOPTION &> /dev/null
    fi
}
