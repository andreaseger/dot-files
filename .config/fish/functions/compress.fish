function compress -d "Compress a file or directory via xz"
    # Show help if no arguments
    if test (count $argv) -eq 0
        echo "Usage: compress <file|directory> [output.txz]"
        echo "  Compresses a file or directory using xz/pixz compression"
        echo "  Output defaults to <name>.txz in the same location"
        return 1
    end

    set source $argv[1]
    
    # Check if source exists
    if not test -e $source
        echo "Error: '$source' does not exist" >&2
        return 1
    end

    # Determine output name
    if test (count $argv) -ge 2
        set destination $argv[2]
    else
        set destination $source.txz
    end

    # Prevent overwriting existing archives
    if test -e $destination
        echo "Error: '$destination' already exists" >&2
        return 1
    end

    # Compress file
    if test -f $source
        echo -s "Compressing file: " (set_color --bold blue) $source (set_color normal) " → " (set_color green) $destination (set_color normal)
        if command -s pixz >/dev/null
            tar -Ipixz -cf $destination $source
        else
            tar -Jcf $destination $source
        end
    # Compress directory
    else if test -d $source
        echo -s "Compressing directory: " (set_color --bold blue) $source (set_color normal) " → " (set_color green) $destination (set_color normal)
        set os (uname)
        if test "$os" = Darwin
            if command -s gtar >/dev/null
                if command -s pixz >/dev/null
                    gtar -Ipixz -cf $destination $source
                else
                    gtar -Jcf $destination $source
                end
            else if command -s pixz >/dev/null
                tar -Ipixz -cf $destination $source
            else
                tar -Jcf $destination $source
            end
        else
            if command -s pixz >/dev/null
                tar -Ipixz -cf $destination $source
            else
                tar -Jcf $destination $source
            end
        end
    else
        echo "Error: '$source' is neither a file nor a directory" >&2
        return 1
    end
end
