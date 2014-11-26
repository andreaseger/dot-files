function .bundle_exec --description 'Add "bunble exec" to start of line'
  set cursor_pos (echo (commandline -C) + 12 | bc)
  commandline -C 0
  commandline -i 'bundle exec '
  commandline -C "$cursor_pos"
end
