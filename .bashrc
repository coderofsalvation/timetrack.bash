# needed by timetrack: this enables a shared bash history across terminals. Avoids duplicates.
# needed by timetrack: When the shell exits, append to the history file instead of overwriting it
# needed by timetrack: After each command, append to the history file and reread it
export HISTCONTROL=ignoredups:erasedups  
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
