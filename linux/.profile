SYSTEMD_EDITOR=/usr/bin/vi;       export SYSTEMD_EDITOR;
EDITOR=/usr/bin/nvim;             export EDITOR;
VISUAL=/usr/bin/nvim;             export VISUAL;

# disable potentially active history files
LESSHISTFILE=/dev/null;           export LESSHISTFILE;
NODE_REPL_HISTORY="";             export NODE_REPL_HISTORY;
PYTHONSTARTUP="$HOME/.pythonrc";  export PYTHONSTARTUP;

# IME exports
GTK_IM_MODULE='fcitx'             export GTK_IM_MODULE;
QT_IM_MODULE='fcitx'              export QT_IM_MODULE;
SDL_IM_MODULE='fcitx'             export SDL_IM_MODULE;
# uncomment GLFW_IM_MODULE export if using kitty terminal
# GLFW_IM_MODULE='ibus'             export GLFW_IM_MODULE;
XMODIFIERS='@im=fcitx'            export XMODIFIERS;

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx > /dev/null 2>&1
fi
