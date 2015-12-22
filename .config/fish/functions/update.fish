function update
  if type pacman >/dev/null
    #archlinux
    if type snapper > /dev/null
      command snapshot_and_update
    else
      pacaur -Syua
    end
  else
    #assuming ubuntu for now
    sudo apt-fast update; and sudo apt-fast upgrade
  end
end
