function .git_current_repository
  set -l ref (git symbolic-ref HEAD 2> /dev/null); or set -l ref (git rev-parse --short HEAD 2> /dev/null); or return
  git remote -v | cut -d':' -f 2
end
