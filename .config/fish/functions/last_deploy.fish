function last_deploy
  echo (git tag | grep "^production" | sort | tail -n1)
end
