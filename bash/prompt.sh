function prompt_command {
  old_exit=$?
  if [[ 0 -eq $old_exit ]]; then
    PS1="$>"
  else
    PS1="!>"
  fi
  $TERMCONF_PATH/scripts/prompt.py
  return $old_exit
}

PS2="..."

XKB_COMMAND='capsoption;'
PROMPT_COMMAND=prompt_command
