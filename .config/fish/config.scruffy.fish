setenv __local_identities $HOME/.ssh/id_rsa

load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify"
. $fish_path/load/rbenv.fish

abbr -a pr 'env RBENV_VERSION=ruby-2.2.4 stash pull-request -o (current_branch) master'

set -x GOPATH $HOME/code/go
add_uniquely_to_user_paths $GOPATH/bin
