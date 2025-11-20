if command -v nvim >/dev/null 2>&1
    set -x EDITOR nvim
    set -x GIT_EDITOR nvim
    set -x VISUAL nvim
else
    set -x EDITOR vim
    set -x GIT_EDITOR vim
    set -x VISUAL vim
end

set -x LANGUAGE en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x XDG_CONFIG_HOME $HOME/.config
set -x GTAGSLABEL pygments
