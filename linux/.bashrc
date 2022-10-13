[[ $- != *i* ]] && return # if not running interactively, don't do anything

shopt -s histappend # append to .bash_history instead of overwriting
# changes the way the history command displays .bash_history
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

stty -ixon # disable XOFF / XON

alias .="pwd"
alias ..="cd .."
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."
alias 5..="cd ../../../../.."

alias q="exit"

alias ls="ls --color=auto"
alias mv="mv -i -v"
alias df="duf"                  # dependency on "duf" package
alias mpv="mpv --keep-open=yes" # dependency on "mpv" package

# silly typos on commands we use a lot
alias ,,="cd .."
alias :q="exit"
alias l="ls --color=auto"
alias cd..="cd .."
alias mdkir="mkdir"
alias sl="ls"
alias sudp="sudo"

# utility commands
alias sc="sudo systemctl"
alias nc="networkctl"
alias reboot="sudo reboot"
alias halt="sudo shutdown -h now"

# temporary spot for webcam command, with dependency on mpv
alias webcam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --vf=lavfi=hflip"

PS1="[\u@\h \W]\$ "

if [ -f "$HOME/.fnm/fnm" ]; then
  export PATH=$HOME/.fnm:$PATH
  eval "$(fnm env --use-on-cd)"
fi
