function pjpp
  set -l lucene_base /usr/experteer/var
  if not test -f $lucene_base/lucene/index.jobs/_x.cfx
    echo "lucene doesn't exists, lets put it in the ramdisk..."
    #sudo chown aeger:users $lucene_base/lucene -R; and cp $lucene_base/plucene/* $lucene_base/lucene/ -R
  end

  set -l pjpp_base $HOME/ram
  if not test -f $pjpp_base/pjpp/CURRENT_INSTALL
    echo "pjpp not ready, copying to ramdisk"
    sudo chown aeger:users $pjpp_base -R; and rsync -av --stats --exclude=/log/\* $HOME/code/pjpp  $pjpp_base
  end

  cd $pjpp_base/pjpp; and pjpp_server.rb
end
