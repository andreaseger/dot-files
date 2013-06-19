function is_dirty
  git status -s --ignore-submodules=dirty ^/dev/null
end