# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby gem zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source $HOME/.aliases.zsh
source $HOME/.extract.zsh
source $HOME/.functions.zsh

# Customize to your needs...

#export PATH=$PATH:/home/sch1zo/opt/rbx/bin:/home/sch1zo/opt/rbx/gems/bin
#export PATH=$PATH:/opt/ruby/bin

export EDITOR=vim
export VISUAL=vim

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
