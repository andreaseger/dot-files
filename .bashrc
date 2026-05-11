# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

if [[ -d ~/.local/share/omarchy ]]; then
  # Omarchy default config
  source ~/.local/share/omarchy/default/bash/rc
fi

# ~/.bashrc — fall back to a simple prompt in Agent sessions
export PYTHONPYCACHEPREFIX="/home/ane/.pycache"
# go
export PATH=/home/ane/go/bin:$PATH
# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

if [[ -n "$CURSOR_AGENT" ]]; then
  PS1='\u@\h \W \$ '
else
  alias cd..="cd .."
  alias ..="cd .."
  alias ...="cd ../.."
  alias h="cd ~"
  alias !="sudo"
  alias l="ls -lah"
  alias l.="ls -d .*"
  alias ll="ls -lh"
  alias g="git"
  alias gst="git status"
  alias dotf='git --git-dir=$HOME/.local/share/dot-files/ --work-tree=$HOME'

  . <(asdf completion bash)
fi

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_BASH_SETUP_PATH=/Users/ane/Library/Caches/@asyncapi/cli/autocomplete/bash_setup && test -f $ASYNCAPI_AC_BASH_SETUP_PATH && source $ASYNCAPI_AC_BASH_SETUP_PATH; # asyncapi autocomplete setup


