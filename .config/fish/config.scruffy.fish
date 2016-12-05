setenv __local_identities $HOME/.ssh/id_rsa

load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify"
. $fish_path/load/rbenv.fish

abbr -a pr 'env RBENV_VERSION=ruby-2.3.3 stash pull-request -o (current_branch) master'
abbr -a ds 'git status -sb | grep "spec.rb" | cut -c4- | xargs bundle exec rspec'

set -x GOPATH $HOME/code/go
add_uniquely_to_user_paths $GOPATH/bin
