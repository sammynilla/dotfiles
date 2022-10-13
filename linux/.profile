if [ -n "$BASH_VERSION" ]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# disable other hist files
LESSHISTFILE=/dev/null;       export LESSHISTFILE
NODE_REPL_HISTORY="";         export NODE_REPL_HISTORY
PYTHONSTARTUP=~/.pythonrc;    export PYTHONSTARTUP

SYSTEMD_EDITOR=/usr/bin/nano; export SYSTEMD_EDITOR
EDITOR=/usr/bin/nvim;         export EDITOR
VISUAL=/usr/bin/nvim;         export VISUAL

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx &> /dev/null
fi
