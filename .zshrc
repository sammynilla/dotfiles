source "$HOME/.bashrc"

if cmd_exists kitty ; then
  kitty + complete setup zsh | source /dev/stdin

  # https://sw.kovidgoyal.net/kitty/invocation/?highlight=session#cmdoption-kitty-session
  #function kt-dev() {
  #  export PROJECT_DIR=$1
  #  kitty --session $HOME/.config/kitty/sessions/dev.conf \
  #        --start-as maximized \
  #  &> /dev/null &
  #}
fi

# https://unix.stackexchange.com/a/544815
function erase_history { local HISTSIZE=0; }
function zshaddhistory_erase_history {
  [[ $1 != [[:space:]]#erase_history[[:space:]]# ]]
}
zshaddhistory_functions+=(zshaddhistory_erase_history)

# ZSH THEME LOADING
autoload -U promptinit; promptinit
# https://github.com/sindresorhus/pure
prompt pure

# Aliases
# These seem to only be available when using /bin/zsh
unalias run-help
unalias which-command
