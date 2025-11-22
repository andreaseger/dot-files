function dotf --wraps git --description 'Manage dotfiles with bare git repo'
    command git --git-dir=$HOME/.local/share/dot-files.git/ --work-tree=$HOME $argv
end
