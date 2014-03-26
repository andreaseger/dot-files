#setup rbenv
set -U fish_user_paths $fish_user_paths $HOME/.rbenv/bin
set -U fish_user_paths $fish_user_paths $HOME/.rbenv/shims
status --is-interactive; and . (rbenv init -|psub)

