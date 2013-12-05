function update
  if test -x ~/.local/bin/snapshot_and_update
    command snapshot_and_update
  else
    sudo powerpill -Syu; and pacaur -Syu
  end
end
