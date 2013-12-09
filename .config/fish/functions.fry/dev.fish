function dev
  ssh -A -t dev.experteer.com -- /home/aeger/.local/bin/fish
  # ssh -t aeger@dev.experteer.com -- screen -URD
end
