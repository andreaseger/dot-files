status is-interactive; or return

# add keybindings:
# C-s prefix line with `sudo`
# C-b prefix line with `bundle exec`
function fish_user_key_bindings
  bind \cs "_prefix_sudo"
  if type -q bundle
    bind \cb "_prefix_bundle_exec"
  end
end
