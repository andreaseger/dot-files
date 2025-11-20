function vim --wraps vim --description 'prefer nvim (fallback to vim)'
    if command -v nvim >/dev/null 2>&1
        nvim $argv
    else
        command vim $argv
    end
end
