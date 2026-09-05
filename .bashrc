# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

if [[ -d ~/.local/share/omarchy ]]; then
  # Omarchy default config
  source ~/.local/share/omarchy/default/bash/rc
fi

export PATH="$HOME/.local/bin:$PATH"
export PYTHONPYCACHEPREFIX="$HOME/.pycache"

# go
[[ -d "$HOME/go/bin" ]] && export PATH="$HOME/go/bin:$PATH"
# rust
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
# mise
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"

# ~/.bashrc — fall back to a simple prompt in Agent sessions
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
  alias dotf='git --git-dir=$HOME/.local/share/dot-files.git/ --work-tree=$HOME'
fi

# AsyncAPI CLI autocomplete (macOS cache dir first, XDG cache dir on Linux)
for _asyncapi_setup in \
  "$HOME/Library/Caches/@asyncapi/cli/autocomplete/bash_setup" \
  "${XDG_CACHE_HOME:-$HOME/.cache}/@asyncapi/cli/autocomplete/bash_setup"; do
  [[ -f "$_asyncapi_setup" ]] && source "$_asyncapi_setup"
done
unset _asyncapi_setup
