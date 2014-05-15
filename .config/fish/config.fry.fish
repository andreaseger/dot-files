setenv __local_identities $HOME/.ssh/experteer_rsa
load-ssh-agent

abbreviate 'server=bundle exec rails server'
abbreviate 'console=bundle exec rails console'

. $fish_path/load/rbenv.fish

. $fish_path/load/virtual.fish

