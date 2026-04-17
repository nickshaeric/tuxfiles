# .bashrc@parabola

[[ $- != *i* ]] && return

# Source git-prompt.sh
# source /path/to/.git-prompt.sh

# Prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1='\w${PS1_CMD1} \$'
