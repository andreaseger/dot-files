set -x __local_identities $HOME/.ssh/id_rsa

load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify"
. $fish_path/load/rbenv.fish
kitty + complete setup fish | source
