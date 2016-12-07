function service --description "connect to service via tmux-cssh" --argument-names "service"
  set --erase argv[1]
  command tmux-cssh -ts cssh-$service -u $service (ask-chef service --name $service $argv)
end
