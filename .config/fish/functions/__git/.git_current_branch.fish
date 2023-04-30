function .git_current_branch
  echo (git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end
