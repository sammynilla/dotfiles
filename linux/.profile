SYSTEMD_EDITOR=/usr/bin/vi;       export SYSTEMD_EDITOR;
EDITOR=/usr/bin/nvim;             export EDITOR;
VISUAL=/usr/bin/nvim;             export VISUAL;

# Hardware video acceleration
LIBVA_DRIVER_NAME="i965";         export LIBVA_DRIVER_NAME;
VDPAU_DRIVER="va_gl";             export VDPAU_DRIVER

# IME exports
GTK_IM_MODULE="fcitx";            export GTK_IM_MODULE;
QT_IM_MODULE="fcitx";             export QT_IM_MODULE;
SDL_IM_MODULE="fcitx";            export SDL_IM_MODULE;
XMODIFIERS="@im=fcitx";           export XMODIFIERS;

# disable potentially active histfiles
LESSHISTFILE=/dev/null;           export LESSHISTFILE;
NODE_REPL_HISTORY="";             export NODE_REPL_HISTORY;
PYTHONSTARTUP="$HOME/.pythonrc";  export PYTHONSTARTUP;
CALCHISTFILE=/dev/null;           export CALCHISTFILE;

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx > /dev/null 2>&1
fi
