# if not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="[\u@\h \W]\$ "

alias .="pwd"
alias ..="cd .."
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias 5..="cd ../../../../.."

alias q="exit"

alias ls="ls --color=auto"
alias mv="mv -i -v"

# silly typos on commands we use a lot
alias ,,="cd .."
alias :q="exit"
alias l="ls --color=auto"
alias cd..="cd .."
alias mdkir="mkdir"
alias sl="ls"
alias sudp="sudo"

alias sc="sudo SYSTEMD_EDITOR=/usr/bin/nvim systemctl"
alias nc="networkctl"
alias psc="cat /sys/class/power_supply/BAT0/capacity"
alias pscw="watch -n0 cat /sys/class/power_supply/BAT0/capacity"

# TODO: move stopping dhcpcd to a shutdown hook
alias reboot="sudo reboot"
alias halt="sudo shutdown -h now"

# disable most hist files
export LESSHISTFILE=/dev/null
export NODE_REPL_HISTORY=""
export PYTHONSTARTUP=~/.pythonrc

if [[ -f $HOME/.fnm/fnm ]]; then
  export PATH=$HOME/.fnm:$PATH
  eval "`fnm env --use-on-cd`"
fi

[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env
