function aquire -d "take ownership of file"
  command sudo chown $USER:(_current_group) $argv
end
