function dotf --wraps "git --git-dir=$HOME/.local/share/dot-files.git/ --work-tree=$HOME" --description 'Manage dotfiles with bare git repo'
    command git --git-dir=$HOME/.local/share/dot-files.git/ --work-tree=$HOME $argv
end
