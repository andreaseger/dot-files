function aquire -d "take ownership of file"
  command sudo chown $USER:(current_group) $argv
end
