function is_dirty
  git status -s --ignore-submodules=dirty 2>/dev/null
end
