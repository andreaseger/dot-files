set fish_greeting ""

set -l fish_path ~/.config/fish
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)

abbr -a ! sudo
abbr -a h ~
function !!; sudo su; end
function l  --wraps ls; ls -lah $argv; end
function l. --wraps ls; ls -d .* $argv; end
function ll --wraps ls; ls -lh $argv; end

abbr -a b bundle
abbr -a be 'bundle exec'
abbr -a v emacsclient -ct
abbr -a e emacsclient -ct
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

    set -l x $fish_path/config.(echo $__fish_hostname).fish
    if test -e $x
      . $x
    end
  end

  # add stuff to path
  add_uniquely_to_user_paths $HOME/.local/bin /usr/bin/core_perl /usr/local/bin
end

for preload in env.fish git-aliases.fish less.fish
  . $fish_path/load/$preload
end

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx GTAGSLABEL pygments

set -g fish_color_host blue

function fish_user_key_bindings
  # bind \e1 ".runsudo"
  bind \cs ".runsudo"
  bind \cb ".bundle_exec"
end

set -g fish_new_pager 1
