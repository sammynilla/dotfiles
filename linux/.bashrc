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
alias df="df -h -x efivarfs -x devtmpfs -x tmpfs"
alias cat="bat -pp" # dependency on "bat" package
alias mpv="mpv --keep-open=yes" # dependency on "mpv" package
# temporary spot for webcam, dependency on mpv
alias webcam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --vf=lavfi=hflip"

# utility commands
alias sc="sudo systemctl"
alias nc="networkctl"
alias reboot="sudo reboot"
alias halt="sudo shutdown -h now"

PS1="[\u@\h \W]\$ "
BAT_STYLE="numbers,changes,rule,header,header-filesize"; export BAT_STYLE;
WIZ_BIN_PATH="/opt/arm-openwiz-linux-gnu/bin"; export PATH="$WIZ_BIN_PATH:$PATH"
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi
