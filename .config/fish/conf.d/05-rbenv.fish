
if test -d $HOME/.rbenv/bin
  # set -gx RBENV_ROOT $HOME/.rbenv
  __add_uniquely_to_user_paths $HOME/.rbenv/bin $HOME/.rbenv/shims
  status --is-interactive; and source (rbenv init -|psub)
end
