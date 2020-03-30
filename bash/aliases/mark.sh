# Relies on $MARKS in env.sh

alias mark='_mark'

function _mark {
    echo $PWD >> $MARKS;
    echo $PWD;
}
