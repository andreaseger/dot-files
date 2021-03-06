complete -c adr -n "__fish_use_subcommand" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
complete -c adr -n "__fish_use_subcommand" -f -a "init" -d 'Initializes the directory of architecture decision records.'
complete -c adr -n "__fish_use_subcommand" -f -a "new" -d 'Creates a new, numbered ADR.'
complete -c adr -n "__fish_use_subcommand" -f -a "link" -d 'Creates a link between two ADRs, from SOURCE to TARGET new.'
complete -c adr -n "__fish_use_subcommand" -f -a "list" -d 'Lists the architecture decision records'
complete -c adr -n "__fish_use_subcommand" -f -a "completions" -d 'Generates completion scripts for your shell'
complete -c adr -n "__fish_use_subcommand" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c adr -n "__fish_seen_subcommand_from init" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_seen_subcommand_from init" -s V -l version -d 'Prints version information'
complete -c adr -n "__fish_seen_subcommand_from new" -s s -l superceded -d 'A reference (number or partial filename) of a previous decision that the new decision supercedes.'
complete -c adr -n "__fish_seen_subcommand_from new" -s l -l link -d 'Links the new ADR to a previous ADR.'
complete -c adr -n "__fish_seen_subcommand_from new" -s o -l open -d 'Open new ADR with EDITOR.'
complete -c adr -n "__fish_seen_subcommand_from new" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_seen_subcommand_from new" -s V -l version -d 'Prints version information'
complete -c adr -n "__fish_seen_subcommand_from link" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_seen_subcommand_from link" -s V -l version -d 'Prints version information'
complete -c adr -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c adr -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_seen_subcommand_from completions" -s V -l version -d 'Prints version information'
complete -c adr -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c adr -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
