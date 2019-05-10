
. $fish_path/load/rbenv.fish

set -x JRUBY_OPTS "--dev -J-noverify"
abbr -a pr 'env RBENV_VERSION=ruby-2.5.3 stash pull-request -o (current_branch) master'
