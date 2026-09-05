status is-interactive; or return

set -l corals jorgebucaran/autopair.fish
for coral in $corals
    if not test -e "$__fish_config_dir/corals/$coral"
        reef install $coral
        # load coral for current session (07-reef ran before it existed, so add its paths now)
        set -a fish_function_path (path resolve $__fish_config_dir/corals/$coral/functions)
        set -a fish_complete_path (path resolve $__fish_config_dir/corals/$coral/completions)
        source (path resolve $__fish_config_dir/corals/$coral/conf.d/*.fish)
    end
end
