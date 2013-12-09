function torrent --description "download torrent using aria2c"
  command aria2c --conf-path=$HOME/.aria2/aria2.torrent $argv
end
