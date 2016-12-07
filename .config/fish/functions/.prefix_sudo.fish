function .prefix_sudo --description 'add "sudo " to current command'
  set cursor_pos (echo (commandline -C) + 5 | bc)
  commandline -C 0
  commandline -i 'sudo '
  commandline -C "$cursor_pos"
end
