function update_weave
  sudo systemctl stop mozillaweave.service
  cd /srv/http/weave/server-full
  hg pull --rebase
  make build
  hg push --force backup
  sudo systemctl start mozillaweave.service
  systemctl status mozillaweave.service
end
