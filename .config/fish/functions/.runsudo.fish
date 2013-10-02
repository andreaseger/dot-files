function .runsudo --description 'Run current command line as root'
  set cursor_pos (echo (commandline -C) + 5 | bc)
  commandline -C 0
  commandline -i 'sudo '
  commandline -C "$cursor_pos"
end
