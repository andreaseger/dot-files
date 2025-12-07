function extract -d "Extract a variety of archive files"
    # Show help if no arguments
    if test (count $argv) -eq 0
        echo "Usage: extract <archive> [archive...]"
        echo "  Extracts archives into a directory named after the archive"
        echo "  Supported: tar, tar.gz, tar.bz2, tar.xz, zip, rar, 7z, gz, bz2, xz, Z, pax"
        return 1
    end

    for file in $argv
        if not test -f $file
            echo "Error: '$file' does not exist or is not a file" >&2
            continue
        end

        # Determine output directory name by stripping known extensions
        set output_dir (basename $file .tar.xz)
        set output_dir (basename $output_dir .tar.gz)
        set output_dir (basename $output_dir .tar.bz2)
        set output_dir (basename $output_dir .tar)
        set output_dir (basename $output_dir .txz)
        set output_dir (basename $output_dir .tgz)
        set output_dir (basename $output_dir .tbz)
        set output_dir (basename $output_dir .tbz2)
        set output_dir (basename $output_dir .xz)
        set output_dir (basename $output_dir .bz2)
        set output_dir (basename $output_dir .gz)
        set output_dir (basename $output_dir .zip)
        set output_dir (basename $output_dir .rar)
        set output_dir (basename $output_dir .7z)
        set output_dir (basename $output_dir .pax)
        set output_dir (basename $output_dir .Z)

        # Check if output directory already exists
        if test -e $output_dir
            echo "Error: '$output_dir' already exists" >&2
            continue
        end

        # Create output directory
        mkdir -p $output_dir
        if test $status -ne 0
            echo "Error: Failed to create directory '$output_dir'" >&2
            continue
        end

        echo -s "Extracting '" (set_color --bold blue) $file (set_color normal) "' → " (set_color green) $output_dir (set_color normal)

        switch $file
            case "*.tar" "*.tar.xz" "*.txz" "*.tar.bz2" "*.tbz" "*.tbz2" "*.tar.gz" "*.tgz"
                tar -xf $file -C $output_dir
            case "*.xz"
                unxz --keep --stdout $file >$output_dir/(basename $file .xz)
            case "*.bz2"
                bunzip2 --keep --stdout $file >$output_dir/(basename $file .bz2)
            case "*.gz"
                gunzip --keep --stdout $file >$output_dir/(basename $file .gz)
            case "*.zip"
                unzip -uo $file -d $output_dir
            case "*.rar"
                unrar x $file $output_dir/
            case "*.7z"
                7za x $file -o$output_dir
            case "*.pax"
                cd $output_dir && pax -r <../$file && cd ..
            case "*.Z"
                uncompress --stdout $file >$output_dir/(basename $file .Z)
            case '*'
                echo "Error: Extension not recognized for '$file'" >&2
                rmdir $output_dir
                continue
        end

        if test $status -ne 0
            echo "Error: Failed to extract '$file'" >&2
            rmdir $output_dir 2>/dev/null
        end
    end
end
