export MARKS="$HOME/tmp/.MARKS"

function mark {
    echo $PWD >> $MARKS;
    echo $PWD;
}

function follow {
    tmp_marks="$MARKS.tmp"
    if [ ! -e $MARKS ]; then
        return
    fi
    if [ "$1" = "-l" ]; then
        cat $MARKS;
        return;
    fi
    follow_dir=$(tail --lines=1 $MARKS)
    head --lines=-1 $MARKS >> $tmp_marks
    mv $tmp_marks $MARKS
    cd $follow_dir
    echo $follow_dir
}
