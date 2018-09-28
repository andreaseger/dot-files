# skip all config if fish in non interactive shells
if not status --is-interactive
  echo "no interactive"
  exit
end

set fish_greeting ""

set -l fish_path $HOME/.config/fish

# load functions also from subdirectories in functions folder
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)


abbr -a ! sudo
abbr -a h ~
function !!; sudo su; end
function l  --wraps ls; ls -lah $argv; end
function l. --wraps ls; ls -d .* $argv; end
function ll --wraps ls; ls -lh $argv; end

abbr -a b bundle
abbr -a be 'bundle exec'
abbr -a v emacsclient -t
abbr -a e emacsclient -t
abbr -a ee emacsclient -nc
abbr -a a 'ag --smart-case --literal'

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
      #echo load $x
      . $x
    end
  end

  # add stuff to path
  add_uniquely_to_user_paths $HOME/.local/bin /usr/bin/core_perl /usr/local/bin
end

for preload in env.fish git-aliases.fish less.fish
  . $fish_path/load/$preload
end

#------------------------------------------------
set -x ERL_AFLAGS "-kernel shell_history enabled"

set -g fish_color_host blue

# add keybindings:
# C-s prefix line with `sudo`
# C-b prefix line with `bundle exec`
function fish_user_key_bindings
  bind \cs ".prefix_sudo"
  bind \cb ".prefix_bundle_exec"
end

## emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# this function may be required
function fish_title
  true
end
