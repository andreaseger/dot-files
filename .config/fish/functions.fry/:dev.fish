function :dev
  command env TERM=xterm ssh -A -t dev.experteer.com -- /home/aeger/.local/bin/fish
end
