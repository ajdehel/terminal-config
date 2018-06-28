export TERMCONF_PATH=$HOME/.termconf

if [ -d $TERMCONF_PATH/bash ]; then
    for it in `ls $TERMCONF_PATH/bash`; do
        if [ ${it%sh} != $it ]; then
            . $TERMCONF_PATH/bash/"$it"
        fi
    done
fi
