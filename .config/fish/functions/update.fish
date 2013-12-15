function update
  if type snapper > /dev/null
    command snapshot_and_update
  else
    sudo powerpill -Syu; and pacaur -Syu
  end
end
