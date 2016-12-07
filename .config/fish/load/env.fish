set -x EDITOR "emacsclient -t -a emacs"
set -x GIT_EDITOR "emacsclient -t -a emacs"
set -x VISUAL "emacsclient -nc -a emacs"

set -x LANGUAGE en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x PAGER less
set -x LESS "-iMSx4 -R"
set -x XDG_CONFIG_HOME $HOME/.config
set -x GTAGSLABEL pygments


alias less $PAGER
alias zless $PAGER
