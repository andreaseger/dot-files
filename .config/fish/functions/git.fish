# git.plugin.zsh
# Aliases

shortcut g 'git'
shortcut gst 'git status'
shortcut gbr 'git rebase -p'
shortcut gup 'git fetch; and gbr origin/(current_branch)'

shortcut gc 'git commit -v'
shortcut gca 'git commit -v -a'
shortcut gco 'git checkout'
shortcut gb 'git branch'
shortcut gba 'git branch -a'

shortcut gcount 'git shortlog -sn'
shortcut glg 'git log --stat --max-count=5'
shortcut glgg 'git log --graph --max-count=5'
shortcut glgga 'git log --graph --decorate --all'
shortcut gss 'git status -s'
shortcut ga 'git add'
shortcut gm 'git merge --no-ff'
shortcut gmff 'git merge -ff'
shortcut gf 'git ls-files | grep'

#shortcut gpoat 'git push origin --all; and git push origin --tags'

# Will cd into the top of the current repository
# or submodule.
shortcut grt 'cd (git rev-parse --show-toplevel; or echo ".")'

# these aliases take advantage of the previous function
shortcut ggpull 'git pull origin (current_branch)'
shortcut ggpush 'git push origin (current_branch)'
shortcut ggpnp 'git pull origin (current_branch); and git push origin (current_branch)'

