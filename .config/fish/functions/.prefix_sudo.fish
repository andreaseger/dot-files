function .prefix_sudo --description 'add "sudo " to current command'
  set cursor_pos (math (commandline -C) + 5)
  commandline -C 0
  commandline -i 'sudo '
  commandline -C "$cursor_pos"
end
