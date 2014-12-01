function gvim
  if test (pgrep -c gvim) -gt 0
    command gvim --remote-tab-silent $argv
  else
    command gvim $argv
  end
end
