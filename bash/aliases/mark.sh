alias mark='_mark'

function _mark {
    echo $PWD >> $MARKS;
    echo $PWD;
}
