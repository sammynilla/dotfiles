export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# https://stackoverflow.com/a/677212
# Avoid using which. Use command, type or hash
function cmd_exists { type "$1" >/dev/null 2>&1 ; }

function md {
  file=${1:-"README.md"}
  pandoc $file | w3m -T text/html 
}

# Aliases
alias ls="ls -AF1x"
alias lss="ls -AF1"
alias ll="ls -AF1l"

alias ..="cd .."
alias ...="cd ../.."
