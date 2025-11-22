# skip all config if fish in non interactive shells
if not status --is-interactive
  exit
end


# load functions also from subdirectories in functions folder
#set fish_function_path $fish_function_path (find $__fish_config_dir/functions/* -type d)
for dir in (find $__fish_config_dir/functions/* -type d)
    set -a fish_function_path $dir
end
#set -a fish_function_path (find $__fish_config_dir/functions/* -type d)
