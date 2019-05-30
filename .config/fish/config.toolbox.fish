set -x __local_identities $HOME/.ssh/id_rsa
# hotspot
#set -x JRUBY_OPTS "--dev -J-noverify"

# openj9
set -x JRUBY_OPTS '-J-Xshareclasses -J-Xscmx100m -J-Xquickstart -J-XX:+IdleTuningGcOnIdle -J-Xtune:virtualized' 

abbr -a pr 'env RBENV_VERSION=ruby-2.5.3 stash pull-request (current_branch) master'
abbr -a ds 'git status -sb | grep "spec.rb" | cut -c4- | xargs bundle exec rspec'

add_uniquely_to_user_paths $HOME/bin/jdk8u202-b08/bin
