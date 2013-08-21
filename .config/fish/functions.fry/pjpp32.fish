function pjpp32
  set -l pjpp_base $HOME/ram
  if not test -f $pjpp_base/pjpp/CURRENT_INSTALL
    echo "pjpp not ready, copying to ramdisk"
    sudo chown aeger:users $pjpp_base -R; and rsync -av --stats --exclude=/log/\* $HOME/code/pjpp32  $pjpp_base
  end

  cd $pjpp_base/pjpp32
end
