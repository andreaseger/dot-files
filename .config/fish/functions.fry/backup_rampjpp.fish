function backup_rampjpp
  rsync -va --exclude=log/\* --delete $HOME/ram/pjpp/ $HOME/code/pjpp
end
