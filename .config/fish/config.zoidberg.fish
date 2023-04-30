set -x __local_identities $HOME/.ssh/id_ed25519
set -x JRUBY_OPTS "--dev -J-noverify"
alias ls=exa
alias k=kubectl
add_uniquely_to_user_paths $HOME/.linkerd2/bin


