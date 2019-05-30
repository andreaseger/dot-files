set -x __local_identities $HOME/.ssh/id_rsa

set -x JRUBY_OPTS "--dev -J-noverify"

kitty + complete setup fish | source
