function dotf --wraps git --description 'Manage dotfiles with bare git repo'
    command git --git-dir=$HOME/.local/share/dot-files.git/ --work-tree=$HOME $argv
end

function dotf-up
    dotf fetch
    dotf rebase --autostash --rebase-merges origin/m
end

function dotf-push
    dotf push -u origin m
end
