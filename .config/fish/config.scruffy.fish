load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify -J-Xmx256m"
. $fish_path/load/rbenv.fish

abbreviate 'pr=env RBENV_VERSION=ruby-2.2.3 stash pull-request -o (current_branch) master'
