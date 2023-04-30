if test -d $HOME/.exenv/bin
  # set -gx EXENV_ROOT $HOME/.exenv
  .add_uniquely_to_user_paths $HOME/.exenv/bin $HOME/.exenv/shims
  status --is-interactive; and . (exenv init -|psub)
end
