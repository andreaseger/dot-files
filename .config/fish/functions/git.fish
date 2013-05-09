# git.plugin.zsh
# Aliases

function make_completion --argument alias command
    complete -c $alias -a "(
        set -l cmd (commandline -op);
        set -e cmd[1];
        complete -C\"$command \$cmd\";
    )"
end
alias g='git'
make_completion g 'git'
alias gst='git status'
make_completion gst 'git status'
alias gbr='git rebase -p'
alias gup='git fetch; and gbr origin/(current_branch)'

alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
make_completion gco 'git checkout'
alias gb='git branch'
alias gba='git branch -a'

alias gcount='git shortlog -sn'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias gss='git status -s'
alias ga='git add'
make_completion ga 'git add'
alias gm='git merge --no-ff'
alias gmff='git merge -ff'
alias gf='git ls-files | grep'

#alias gpoat='git push origin --all; and git push origin --tags'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd (git rev-parse --show-toplevel; or echo ".")'

# these aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
alias ggpush='git push origin (current_branch)'
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'

