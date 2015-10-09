set fish_greeting ""

set -l fish_path ~/.config/fish
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)
# setup/init fish_user_abbreviations
set -U fish_user_abbreviations '!=sudo'
if status --is-interactive
  eval sh $fish_path/load/base16-default.dark.sh
end

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
#for preload in (find $fish_path/load/* -name '*.fish')
#  . $preload
#end
for preload in env.fish git-aliases.fish less.fish
  . $fish_path/load/$preload
end

abbreviate 'h=~'
function !!; sudo su; end
abbreviate 'tf=tail -f'
function l ; ls -lah $argv; end
function l.; ls -d .* $argv; end
function ll; ls -lh $argv; end
function l  --wraps ls; ls -lah $argv; end
function l. --wraps ls; ls -d .* $argv; end
function ll --wraps ls; ls -lh $argv; end
abbreviate 'subl=subl3'

# abbreviate '!=sudo'
abbreviate 'b=bundle'
abbreviate 'be=bundle exec'
abbreviate 's=subl3'
abbreviate 'v=vim'
abbreviate 'a=ag --smart-case --literal'
abbreviate 'p=pacaur'

set -g fish_color_host blue

function fish_user_key_bindings
  # bind \e1 ".runsudo"
  bind \cs ".runsudo"
  bind \cb ".bundle_exec"
end

set -g fish_new_pager 1
