function tmux --wraps tmux
    echo (count $argv)
    if test (count $argv) -eq 0
        command tmux new-session -A -s main
    else
        command tmux $argv
    end
end
