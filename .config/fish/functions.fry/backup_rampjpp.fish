function backup_rampjpp
  for x in pjpp pjpp32
    if test -e $HOME/ram/$x/CURRENT_INSTALL
      rsync -va --exclude-from=$HOME/pjpp_sync_excludes --delete $HOME/ram/$x/ $HOME/code/$x
    end
  end
end
