function get --description "download thing using aria2c" --wraps aria2c
  command aria2c --conf-path=$HOME/.aria2/aria2.conf $argv
end
