function add_uniquely_to_user_paths --description "add a path to user_paths if its not already included"
  for x in $argv
    if test -d $x
      if not contains $x $fish_user_paths
        set -U fish_user_paths $x $fish_user_paths
      end
    end
  end
end

