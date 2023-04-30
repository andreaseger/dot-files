# add keybindings:
# C-s prefix line with `sudo`
# C-b prefix line with `bundle exec`
function fish_user_key_bindings
  bind \cs ".prefix_sudo"
  bind \cb ".prefix_bundle_exec"
end