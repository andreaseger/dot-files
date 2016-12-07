function .prefix_bundle_exec --description 'Add "bunble exec" to start of line'
  set cursor_pos (math (commandline -C) + 12)
  commandline -C 0
  commandline -i 'bundle exec '
  commandline -C "$cursor_pos"
end
