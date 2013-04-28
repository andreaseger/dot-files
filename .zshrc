# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="agnoster-patched"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

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
export PATH=$PATH:$HOME/.local/bin

export EDITOR=vim
export VISUAL=vim

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#export JRUBY_OPTS="-Xcompile.invokedynamic=true -J-Xmn1024m -J-Xms4096m -J-Xmx4096m -J-server"
#export OMP_NUM_THREADS=4

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#export PATH=$PATH:/opt/vc/bin
#export LD_LIBRARY_PATH=$LD_LIBRARYPATH:/opt/vc/lib

# golang
PATH=$PATH:$HOME/gocode/bin
GOPATH=$HOME/gocode

# load local settings
if [ -r "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
