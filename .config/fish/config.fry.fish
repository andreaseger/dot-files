setenv __local_identities $HOME/.ssh/experteer_rsa
load-ssh-agent

abbreviate 'server=bundle exec rails s'
abbreviate 'console=bundle exec pry -r config/environment'
