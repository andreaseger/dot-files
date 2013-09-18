set fish_greeting ""

set -l fish_path ~/.config/fish
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)
# setup/init fish_user_abbreviations
set -U fish_user_abbreviations '!=sudo'

# load local config (stuff like PATH)
begin
  set -l x $fish_path/config.(hostname -s).fish
  if test -e $x
    . $x
  end
  set -l x $fish_path/functions.(hostname -s)
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

alias h '~'
alias !!   "sudo su"
alias tf   "tail -f"
alias l    'ls -lah'
alias l.   'ls -d .*'
alias ll   'ls -lh'
alias subl subl3

# abbreviate '!=sudo'
abbreviate 'b=bundle'
abbreviate 'be=bundle exec'
abbreviate 's=subl3'
abbreviate 'v=vim'
abbreviate 'a=ag --smart-case --literal'

set -g fish_color_host blue

