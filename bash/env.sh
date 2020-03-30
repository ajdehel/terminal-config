export EDITOR="vim"
export VISUAL="vim"
export PATH="$PATH:$JAVA_HOME/bin"

if [ ! -d "$HOME/tmp" ]; then
    mkdir $HOME/tmp
fi
export MARKS="$HOME/tmp/.MARKS"
