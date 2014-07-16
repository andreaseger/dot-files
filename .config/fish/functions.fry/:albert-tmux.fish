function :albert-tmux
  command env TERM=xterm ssh -t -A classifier@albert.experteer.com -- tmux attach
end
