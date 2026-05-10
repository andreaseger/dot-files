set -l corals jorgebucaran/autopair.fish
for coral in $corals
    if not test -e "$__fish_config_dir/corals/$coral"
        reef install $coral
        # load coral for current session
        source (path resolve $__fish_config_dir/corals/$coral/conf.d/*.fish)
    end
end
