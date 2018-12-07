set -x __local_identities $HOME/.ssh/id_rsa

load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify"
. $fish_path/load/rbenv.fish

abbr -a pr 'env RBENV_VERSION=ruby-2.5.3 stash pull-request (current_branch) master'
abbr -a ds 'git status -sb | grep "spec.rb" | cut -c4- | xargs bundle exec rspec'

set -x GOPATH $HOME/code/go
set -x GOBIN $GOPATH/bin
add_uniquely_to_user_paths $GOBIN
add_uniquely_to_user_paths $HOME/.cargo/bin
