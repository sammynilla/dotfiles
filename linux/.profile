if [ -n "${BASH_VERSION}" ]; then
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

SYSTEMD_EDITOR=/usr/bin/vi;       export SYSTEMD_EDITOR;
EDITOR=/usr/bin/nvim;             export EDITOR;
VISUAL=/usr/bin/nvim;             export VISUAL;

# disable potentially active history files
LESSHISTFILE=/dev/null;           export LESSHISTFILE;
NODE_REPL_HISTORY="";             export NODE_REPL_HISTORY;
PYTHONSTARTUP="$HOME/.pythonrc";  export PYTHONSTARTUP;

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx > /dev/null 2>&1
fi
