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

export PATH=/home/ane/.rbenv/shims:/home/ane/.local/share/nvm/v16.14.2/bin:/home/ane/.linkerd2/bin:/home/ane/code/go/bin:/home/ane/.cargo/bin:/home/ane/.rbenv/shims:/home/ane/.rbenv/bin:/usr/local/bin:/home/ane/.local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/dotnet/:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/Docker/Docker/resources/bin:/mnt/c/ProgramData/DockerDesktop/version-bin:/mnt/c/Users/andre/scoop/shims:/mnt/c/Users/andre/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/andre/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/andre/AppData/Local/Microsoft/WindowsApps:/snap/bin:/home/ane/bin/gyb

export PATH=/home/ane/.rbenv/shims:/home/ane/.linkerd2/bin:/home/ane/code/go/bin:/home/ane/.cargo/bin:/home/ane/.rbenv/shims:/home/ane/.rbenv/bin:/usr/local/bin:/home/ane/.local/bin:/home/ane/.local/share/nvm/v16.14.2/bin:/home/ane/.rbenv/shims:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/dotnet/:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/Docker/Docker/resources/bin:/mnt/c/ProgramData/DockerDesktop/version-bin:/mnt/c/Users/andre/scoop/shims:/mnt/c/Users/andre/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/andre/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/andre/AppData/Local/Microsoft/WindowsApps:/snap/bin:/home/ane/bin/gyb
