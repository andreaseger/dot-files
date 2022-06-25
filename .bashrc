PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local BRANCH=$(git symbolic-ref HEAD 2>/dev/null | sed -e "s|^refs/heads/||")
    
    PS1=""

    local RESET='\[$(tput sgr0)\]'
    local RED='\[$(tput setaf 1)\]'
    local GREEN='\[$(tput setaf 2)\]'
    local YELLOW='\[$(tput setaf 3)\]'
    local BLUE='\[$(tput setaf 4)\]'
    local MAGENTA='\[$(tput setaf 5)\]'
    local CYAN='\[$(tput setaf 6)\]'
    local WHITE='\[$(tput setaf 7)\]'

    PS1+="$GREEN\w$RESET"  # cwd
    if [[ $BRANCH != "" ]]; then
      PS1+=" ($CYAN$BRANCH$RESET)"
    fi

    if [ $EXIT != 0 ]; then
        PS1+="[$RED$EXIT$RESET]"
    fi
    PS1+='\$ '
}

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias h="cd ~"
alias !="sudo"
alias l="ls -lah"
alias l.="ls -d .*"
alias ll="ls -lh"
alias g="git"
alias gst="git status"
. "$HOME/.cargo/env"


