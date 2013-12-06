function __fish_btrfs_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'btrfs' ]
    return 0
  end
  return 1
end

function __fish_btrfs_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c btrfs -n '__fish_btrfs_needs_command' -a subvolume
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a filesystem
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a device
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a scrub
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a inspect-internal
complete    -c btrfs -n '__fish_btrfs_needs_command' -a check                 -d "Check an unmounted btrfs filesystem."
complete    -c btrfs -n '__fish_btrfs_needs_command' -a chunk-recover         -d "Recover the chunk tree by scaning the devices one by one."
complete    -c btrfs -n '__fish_btrfs_needs_command' -a restore               -d "Try to restore files from a damaged filesystem (unmounted)"
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a send                  -d "Send the subvolume to stdout."
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a receive               -d "Receive subvolumes from stdin."
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a help -d "Dislay help information"
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a version -d "Display btrfs-progs version"
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a quota
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a replace
complete -f -c btrfs -n '__fish_btrfs_needs_command' -a qgroup

# help commands
complete -f -c btrfs -n '__fish_btrfs_using_command subvolume' -l help -d "Display help for subvolume"
complete -f -c btrfs -n '__fish_btrfs_using_command filesystem' -l help -d "Display help for filesystem"
complete -f -c btrfs -n '__fish_btrfs_using_command device' -l help -d "Display help for device"
complete -f -c btrfs -n '__fish_btrfs_using_command scrub' -l help -d "Display help for scrub"
complete -f -c btrfs -n '__fish_btrfs_using_command inspect-internal' -l help -d "Display help for inspect-internal"
complete -f -c btrfs -n '__fish_btrfs_using_command check' -l help -d "Display help for check"
complete -f -c btrfs -n '__fish_btrfs_using_command chunk-recover' -l help -d "Display help for chunk-recover"
complete -f -c btrfs -n '__fish_btrfs_using_command restore' -l help -d "Display help for restore"
complete -f -c btrfs -n '__fish_btrfs_using_command send' -l help -d "Display help for send"
complete -f -c btrfs -n '__fish_btrfs_using_command receive' -l help -d "Display help for receive"
complete -f -c btrfs -n '__fish_btrfs_using_command help' -l help -d "Display help for help"
complete -f -c btrfs -n '__fish_btrfs_using_command version' -l help -d "Display help for version"
complete -f -c btrfs -n '__fish_btrfs_using_command quota' -l help -d "Display help for quota"
complete -f -c btrfs -n '__fish_btrfs_using_command replace' -l help -d "Display help for replace"
complete -f -c btrfs -n '__fish_btrfs_using_command qgroup' -l help -d "Display help for qgroup"
complete -f -c btrfs -n '__fish_btrfs_using_command help' -l full


# subvolume subcommand
complete -f -c btrfs -n '__fish_btrfs_using_command subvolume' -a create      -d "Create a subvolume"
complete -f -c btrfs -n '__fish_btrfs_using_command subvolume' -a delete      -d "Delete subvolume(s)"
complete -f -c btrfs -n '__fish_btrfs_using_command subvolume' -a list        -d "List subvolumes (and snapshots)"
# complete -f -c btrfs -n '__fish_btrfs_using_command subvolume' -a snapshot  -d "btrfs subvolume snapshot [-r] [-i <qgroupid>] <source> [<dest>/]<name>"
complete    -c btrfs -n '__fish_btrfs_using_command subvolume' -a get-default -d "Get the default subvolume of a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command subvolume' -a set-default -d "Set the default subvolume of a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command subvolume' -a find-new    -d "List the recently modified files in a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command subvolume' -a show        -d "Show more information of the subvolume"

# filesystem subcommand
complete    -c btrfs -n '__fish_btrfs_using_command filesystem' -a df         -d "Show space usage information for a mount point"
complete    -c btrfs -n '__fish_btrfs_using_command filesystem' -a show       -d "Show the structure of a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command filesystem' -a sync       -d "Force a sync on a filesystem"
complete -f -c btrfs -n '__fish_btrfs_using_command filesystem' -a defragment -d "Defragment a file or a directory"
complete -f -c btrfs -n '__fish_btrfs_using_command filesystem' -a resize     -d "Resize a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command filesystem' -a label      -d "Get or change the label of a filesystem"

# device subcommand
complete    -c btrfs -n '__fish_btrfs_using_command device' -a add            -d "Add a device to a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command device' -a delete         -d "Remove a device from a filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command device' -a scan           -d "Scan devices for a btrfs filesystem"
complete    -c btrfs -n '__fish_btrfs_using_command device' -a ready          -d "Check device to see if it has all of it's devices in cache for mounting"
complete    -c btrfs -n '__fish_btrfs_using_command device' -a stats          -d "Show current device IO stats. -z to reset stats afterwards."

# scrub subcommand
complete    -c btrfs -n '__fish_btrfs_using_command scrub' -a start                 -d "Start a new scrub"
complete    -c btrfs -n '__fish_btrfs_using_command scrub' -a cancel                -d "Cancel a running scrub"
complete    -c btrfs -n '__fish_btrfs_using_command scrub' -a resume                -d "Resume previously canceled or interrupted scrub"
complete    -c btrfs -n '__fish_btrfs_using_command scrub' -a status                -d "Show status of running or finished scrub"

# inspect-internal subcommand
complete    -c btrfs -n '__fish_btrfs_using_command inspect-internal' -a inode-resolve    -d "Get file system paths for the given inode"
complete    -c btrfs -n '__fish_btrfs_using_command inspect-internal' -a logical-resolve  -d "Get file system paths for the given logical address"
complete    -c btrfs -n '__fish_btrfs_using_command inspect-internal' -a subvolid-resolve -d "Get file system paths for the given subvolume ID."

# quota subcommand
complete    -c btrfs -n '__fish_btrfs_using_command quota' -a enable    -d "Enable subvolume quota support for a filesystem."
complete    -c btrfs -n '__fish_btrfs_using_command quota' -a disable   -d "Disable subvolume quota support for a filesystem."
complete    -c btrfs -n '__fish_btrfs_using_command quota' -a rescan    -d "Trash all qgroup numbers and scan the metadata again with the current config."

# qgroup subvolume
complete    -c btrfs -n '__fish_btrfs_using_command qgroup' -a assign   -d "Enable subvolume qgroup support for a filesystem."
complete    -c btrfs -n '__fish_btrfs_using_command qgroup' -a remove   -d "Remove a subvol from a quota group."
complete    -c btrfs -n '__fish_btrfs_using_command qgroup' -a create   -d "Create a subvolume quota group."
complete    -c btrfs -n '__fish_btrfs_using_command qgroup' -a destroy  -d "Destroy a subvolume quota group."
complete    -c btrfs -n '__fish_btrfs_using_command qgroup' -a show     -d "Show all subvolume quota groups."
complete    -c btrfs -n '__fish_btrfs_using_command qgroup' -a limit    -d "Limit the size of a subvolume quota group."

# replace subvolume
complete    -c btrfs -n '__fish_btrfs_using_command replace' -a start   -d "Replace device of a btrfs filesystem."
complete    -c btrfs -n '__fish_btrfs_using_command replace' -a status  -d "Print status and progress information of a running device replace"
complete    -c btrfs -n '__fish_btrfs_using_command replace' -a cancel  -d "Cancel a running device replace operation."

