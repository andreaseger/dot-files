#
# Will return the current branch name
# Usage example: git pull origin (current_branch)
#
function current_branch
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function is_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function current_repository
  set -l ref (git symbolic-ref HEAD 2> /dev/null); or set -l ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end
