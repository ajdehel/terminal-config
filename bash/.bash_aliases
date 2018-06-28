export TERMCONF_DIR=~/.termconf.g
if [ -d $TERMCONF_DIR/bash ]; then
    for it in `ls $TERMCONF_DIR/bash`; do
        if [ ${it%sh} != $it ]; then
            . $TERMCONF_DIR/bash/"$it"
        fi
    done
fi
