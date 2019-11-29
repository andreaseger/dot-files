function remove_from_user_paths --description "remove a path from user_paths" -a path
  echo $fish_user_paths
  set tmp
  for x in $fish_user_paths
    if test "$x" != "$path"
      set tmp $tmp $x
    end
  end
  echo $tmp
  set fish_user_paths $tmp
end

