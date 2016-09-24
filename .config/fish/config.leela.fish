setenv __local_identities ~/.ssh/id_rsa

load-ssh-agent
set -x JRUBY_OPTS "--dev -J-noverify"

. $fish_path/load/rbenv.fish
#set -U fish_user_paths $fish_user_paths '/usr/local/heroku/bin'
#. $fish_path/load/exenv.fish
# . $fish_path/load/virtual.fish

add_uniquely_to_user_paths $HOME/code/go/bin
add_uniquely_to_user_paths $HOME/.cargo/bin

#use ripgrep instead of ag
abbr -e a
abbr -a a rg -F -i
