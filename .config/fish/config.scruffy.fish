load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify"
. $fish_path/load/rbenv.fish

abbr -a rweb='cd ~/runtastic/runtastic-web'
abbr -a pr='env RBENV_VERSION=ruby-2.2.3 stash pull-request -o (current_branch) master'
