#setenv __local_identities $HOME/.ssh/experteer_rsa
load-ssh-agent

#set -U fish_user_paths $fish_user_paths '/usr/local/heroku/bin'
. $fish_path/load/rbenv.fish
#. $fish_path/load/exenv.fish
# . $fish_path/load/virtual.fish

add_uniquely_to_user_paths $HOME/code/go/bin