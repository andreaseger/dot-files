# my own aliases
alias sudp='sudo '
alias sudo='sudo '
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias grb='git rebase -p'
compdef _git grb=git-rebase
alias gup='git fetch origin && grb origin/$(current_branch)'
compdef _git gup=git-rebase
alias gm='git merge --no-ff'

alias b='bundle '
alias be='bundle exec '

alias gvim="gvim --remote-tab-silent "
alias gim="gvim "

alias pi="ssh sch1zo@192.168.178.25 -t tmux"

alias xelatexmk='latexmk -pvc -e "\$pdflatex=q/xelatex %O -interaction=nonstopmode -synctex=1 %S/" -pdf '
alias pdflatexmk='latexmk -pvc -e "\$pdflatex=q/pdflatex %O -interaction=nonstopmode -synctex=1 %S/" -pdf '
