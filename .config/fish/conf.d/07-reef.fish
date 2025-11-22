set -a fish_function_path (path resolve $__fish_config_dir/corals/*/*/functions)
set -a fish_complete_path (path resolve $__fish_config_dir/corals/*/*/completions)

# eagerly source reef itself to ensure its functions are available
source (path resolve $__fish_config_dir/functions/__reef/reef.fish)

# Source all coral conf.d/*.fish files
for conf in (path resolve $__fish_config_dir/corals/*/*/conf.d/*.fish)
    set base (basename $conf)
    if [ $base != "reef.fish" ]
        source $conf
    end
end

