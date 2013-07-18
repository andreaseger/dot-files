set fish_greeting ""

set -l fish_path ~/.config/fish
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)

# load local config (stuff like PATH)
begin
  set -l x $fish_path/config.(hostname).fish
  if test -e $x
    . $x
  end
  set -l x $fish_path/functions.(hostname)
  if test -e $x
    set fish_function_path $fish_function_path $x
  end

  # add stuff to path
  for x in $HOME/.local/bin /usr/bin/core_perl
    if test -e $x
      set -U fish_user_paths $fish_user_paths $x
    end
  end
end
for preload in (ls $fish_path/load)
  . $fish_path/load/$preload
end

function fish_user_key_bindings
  bind \  '__fish_expand_abbreviation; commandline -i " "'
  bind \n '__fish_expand_abbreviation; commandline -f execute'
end

abbreviate !    "sudo"
alias !!   "sudo su"
alias tf   "tail -f"
alias l    'ls -lah'
alias l.   'ls -d .*'
alias ll   'ls -lh'

alias b    'bundle'
abbreviate be   'bundle exec'

alias subl subl3
alias s 'subl3'

alias h '~'
set -g fish_color_host blue
