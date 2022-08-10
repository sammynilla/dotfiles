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
alias psc="cat /sys/class/power_supply/BAT0/capacity"
alias pscw="watch -n0 cat /sys/class/power_supply/BAT0/capacity"

# TODO: move stopping dhcpcd to a shutdown hook
alias reboot="sudo systemctl stop dhcpcd; sudo reboot"
alias halt="sudo systemctl stop dhcpcd; sudo shutdown -h now"

export LESSHISTFILE=/dev/null
export PYTHONSTARTUP=~/.pythonrc
