export EDITOR="vim"
export VISUAL="vim"

if [ ! -d "$HOME/tmp" ]; then
    mkdir $HOME/tmp
fi
export MARKS="$HOME/tmp/.MARKS"
export CAPSOPTION="escape"
