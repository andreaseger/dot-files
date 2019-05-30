set -x EDITOR vim
set -x GIT_EDITOR vim
set -x VISUAL vim

set -x LANGUAGE en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x PAGER less
set -x LESS "-iMSx4 -R"
set -x XDG_CONFIG_HOME $HOME/.config
set -x GTAGSLABEL pygments

set -x ERL_AFLAGS "-kernel shell_history enabled"

## emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

set -x GOPATH $HOME/code/go
set -x GOBIN $GOPATH/bin

add_uniquely_to_user_paths $GOBIN $HOME/.cargo/bin

alias less $PAGER
alias zless $PAGER
