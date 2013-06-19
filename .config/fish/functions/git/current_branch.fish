function current_branch
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end