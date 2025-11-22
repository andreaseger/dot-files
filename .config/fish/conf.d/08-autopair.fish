set -l coral "jorgebucaran/autopair.fish"
if not test -e "$__fish_config_dir/corals/$coral"
    reef install $coral
    # load autopair.fish for current session
    source (path resolve $__fish_config_dir/corals/$coral/conf.d/*.fish)
end
