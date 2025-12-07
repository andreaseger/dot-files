function rand --description 'Generate a random string of specified length (default 32)'
    set -l length $argv[1]
    if test -z "$length"
        set length 32
    end
    
    # Calculate bytes needed (round up)
    set -l bytes_needed (math "ceil(($length + 1) / 2)")
    
    # Generate exactly the needed bytes and convert to hex
    command head -c $bytes_needed /dev/urandom | od -An -tx1 | tr -d ' \n' | cut -c1-$length
end
