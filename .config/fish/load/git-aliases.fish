# git.plugin.zsh
# Aliases

abbreviate 'g=git'
abbreviate 'gst=git status -sb'

alias gbr 'git rebase -p'
alias gup 'git fetch; and git rebase -p (upstream_branch)'

abbreviate 'ga=git add'
abbreviate 'ga.=git add --all .'
abbreviate 'gc=git commit -v'
abbreviate 'gca=git commit -v -a'
abbreviate 'gcam=git commit -v --amend'

abbreviate 'gco=git checkout'
abbreviate 'gco.=git checkout .'
abbreviate 'gb=git branch'
abbreviate 'gba=git branch -a'
abbreviate 'gd=git diff'
abbreviate 'gdw=git diff --word-diff'
abbreviate 'gds=git diff --staged'


abbreviate 'gsh=git show'
abbreviate 'gss=git stash save'
abbreviate 'gsp=git stash pop'

alias gcount 'git shortlog -sn'
alias gl 'git lg'
alias glg 'git log --stat --max-count=5'
alias glgg 'git log --graph --max-count=5'
alias glgga 'git log --graph --decorate --all'
# alias gss 'git status -s'

alias gm 'git merge --no-ff'
alias gmff 'git merge -ff'
# alias gf 'git ls-files | grep'

#abbreviate gpoat 'git push origin --all; and git push origin --tags'

# Will cd into the top of the current repository
# or submodule.
alias grt 'cd (git rev-parse --show-toplevel; or echo ".")'

# these aliases take advantage of the previous function
#alias ggpull 'git pull origin (current_branch)'
#alias ggpush "git push (current_remote) (current_branch)"
abbreviate "ggpush=git push origin (current_branch)"
alias ggpnp "git pull (current_remote) (current_branch); and git push (current_remote) (current_branch)"

