#set -x __local_identities $HOME/.ssh/id_rsa

set -x KUBECTL_PLUGINS_PATH "$HOME/code/oc-plugins"
set -x JRUBY_OPTS "--dev -J-noverify"
alias ls=exa
