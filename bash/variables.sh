#=====================================================#
# Bash Custom Variables                               #
#=====================================================#

#Format Variables
##Font format options
BOLD="\[\e[1m\]"
DIM="\[\e[2m\]"
UNDERLINED="\[\e[4m\]"
REVERSE="\[\e[7m\]"
## Font resets
RESET_BOLD="\[\e[21m\]"
RESET_DIM="\[\e[22m\]"
RESET_UNDERLINED="\[\e[24m\]"
RESET_REVERSE="\[\e[27m\]"
RESET_ALL="\[\e[0m\]"
##Color format options
###
RESET_COLOR="\[\e[39m\]"
### RyGB
RED="\[\e[31m\]"
YELLOW="\[\e[33m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
### grayscale  { 0:white,...?:black }
WHITE="\[\e[97m\]"
GREY="\[\e[38;5;245m\]"
BLACK="\[\e[30m\]"
### other
BEIGE="\[\e[38;5;223m\]"
CYAN="\[\e[38;5;45m\]"
LAVENDER="\[\e[38;5;213m\]"
YELLOW_GREEN="\[\e[38;5;118m\]"
## Convenience format options
DEFAULT=$RESET_ALL$RESET_COLOR

# multi-line prompt defaults
user_f="$DEFAULT$BOLD"
base_f="$DEFAULT$BOLD$UNDERLINED"
path_f="$DEFAULT"
header_f="$DEFAULT$BOLD"
git_branch_f="$DEFAULT$BOLD"
success_f="$DEFAULT$BOLD$GREEN"
failure_f="$DEFAULT$BOLD$RED"


