# Make helper functions available in interactive and scripted shells.
for dir in (find $__fish_config_dir/functions/* -type d)
    set -a fish_function_path $dir
end
