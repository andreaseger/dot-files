function service --description "connect to service via tmux-cssh"
  set service $argv[1]
  set --erase argv[1]
  command tmux-cssh -ts cssh-$service -u $service (ask-chef --pem-path $HOME/runtastic/readonly.pem hosts --service $service $argv)
end