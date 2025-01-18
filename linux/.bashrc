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

alias ls="lsd" # dependency on lsd
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

PS1='\[\e[1;33m\]「\[\e[0m\]$PWD \[\e[1;33m\]」\[\e[0m\]\n \[\e[1;33m\]▶\[\e[0m\] '
PS1="$PS1\[\e[ m\]" # "\[\e[ m\]" acts as a scrollback marker for st

MANPAGER="nvim +Man!"; [ -f "/usr/bin/nvim" ] && export MANPAGER;
BAT_STYLE="numbers,changes,rule,header,header-filesize"; export BAT_STYLE;
OPENWIZ_BIN="/opt/arm-openwiz-linux-gnu/bin"; export PATH="$PATH:$OPENWIZ_BIN"
BROWSER=firefox; export BROWSER; # forgot why I added this, keeping for now.

# might move this at some point
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"; export PKG_CONFIG_PATH;

FNM="$HOME/.local/share/fnm"
if [ -d "$FNM" ]; then
  export PATH="$FNM:$PATH"
  eval "$(fnm env)"
fi

EMSDK="$HOME/emsdk"
EMSCRIPTEN="$EMSDK/upstream/emscripten"
if [ -d "$EMSDK" ] && [ -d "$EMSCRIPTEN" ]; then
  export EMSDK;
  export PATH="$EMSDK:$EMSCRIPTEN:$PATH"
fi
