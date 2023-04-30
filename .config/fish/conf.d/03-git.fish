abbr -a g 'git'
abbr -a gst 'git status -sb'

function gbr; git rebase -p $argv; end
function gup; git fetch; and git rebase --autostash --rebase-merges (.git_upstream_branch); end

abbr -a ga 'git add'
abbr -a ga. 'git add --all .'
abbr -a gc 'git commit -v'
abbr -a gca 'git commit -v -a'
abbr -a gcam 'git commit -v --amend'

abbr -a gco 'git checkout'
abbr -a gco. 'git checkout .'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gd 'git diff'
abbr -a gdw 'git diff --word-diff'
abbr -a gds 'git diff --staged'

abbr -a gsh 'git show'
abbr -a gss 'git stash save'
abbr -a gsp 'git stash pop'

abbr -a gg 'git grep'

function gr --description "Move to the top level of the current git repo"
  cd (git rev-parse --show-toplevel; or echo '.'); 
end



abbr -a ggpush 'git push -u origin (.git_current_branch)'
