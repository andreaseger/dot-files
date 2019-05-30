function __compact_fish_user_paths --description "remove missing directories from fish_user_paths"
  set -l tmp_user_paths
  for x in $fish_user_paths
    if test -d $x
      echo $x
    end
  end
  echo $tmp_user_paths
end