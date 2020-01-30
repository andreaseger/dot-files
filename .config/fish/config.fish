# skip all config if fish in non interactive shells
if not status --is-interactive
  exit
end

set -l fish_path $HOME/.config/fish

# load functions also from subdirectories in functions folder
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)

abbr -a ! sudo
abbr -a h ~
function !!; sudo su; end
function l  --wraps ls; ls -lah --git $argv; end
function l. --wraps ls; ls -d .* $argv; end
function ll --wraps ls; ls -lh --git $argv; end

abbr -a b bundle
abbr -a be 'bundle exec'
abbr -a a rg --hidden -p -i --fixed-strings

# load local config (stuff like PATH)
begin
  set -l __fish_hostnames (hostname -s)
  if test $__fish_hostnames != (hostname)
    set -l __fish_hostnames $__fish_hostnames (hostname)
  end
  for __fish_hostname in $__fish_hostnames
    set -l x $fish_path/functions.$__fish_hostname
    if test -e $x
      set fish_function_path $fish_function_path $x
    end

    set -l x $fish_path/config.$__fish_hostname.fish
    if test -e $x
      . $x
    end
  end

  # add stuff to path
  add_uniquely_to_user_paths $HOME/.local/bin /usr/bin/core_perl /usr/local/bin
end

for preload in env.fish git-aliases.fish less.fish init-ssh-agent.fish rbenv.fish
  . $fish_path/load/$preload
end

#------------------------------------------------

set -g fish_color_host blue
set -g fish_color_ruby red

# add keybindings:
# C-s prefix line with `sudo`
# C-b prefix line with `bundle exec`
function fish_user_key_bindings
  bind \cs ".prefix_sudo"
  bind \cb ".prefix_bundle_exec"
end

# this function may be required
function fish_title
  true
end

# fix colors (for solarized light)
set fish_color_search_match --background='eee8d5'
set fish_color_command 586e75
set fish_pager_color_prefix 93a1a1
