#setup rbenv
# set -gx RBENV_ROOT $HOME/.rbenv
add_uniquely_to_user_paths $HOME/.rbenv/bin $HOME/.rbenv/shims
status --is-interactive; and . (rbenv init -|psub)

