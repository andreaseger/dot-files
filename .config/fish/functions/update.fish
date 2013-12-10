function update
  if test -x snapper
    command snapshot_and_update
  else
    sudo powerpill -Syu; and pacaur -Syu
  end
end
