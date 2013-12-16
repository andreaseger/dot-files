function pjpp
  set -l pjpp_base $HOME/ram
  if not test -f $pjpp_base/pjpp/CURRENT_INSTALL
    echo "pjpp not ready, copying to ramdisk"
    sudo chown aeger:users $pjpp_base -R; and rsync -av --stats --exclude-from=$HOME/pjpp_sync_excludes $HOME/code/pjpp/  $pjpp_base/pjpp
  end

  cd $pjpp_base/pjpp
end
