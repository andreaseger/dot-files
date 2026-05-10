set -l corals jorgebucaran/autopair.fish
for coral in $corals
    if not test -e "$__fish_config_dir/corals/$coral"
        reef install $coral
    end
end
