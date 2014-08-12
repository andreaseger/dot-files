set fish_greeting ""

set -l fish_path ~/.config/fish
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)
# setup/init fish_user_abbreviations
set -U fish_user_abbreviations '!=sudo'

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
  for x in $HOME/.local/bin /usr/bin/core_perl /usr/local/bin
    if test -e $x
      set -U fish_user_paths $fish_user_paths $x
    end
  end
end
#for preload in (find $fish_path/load/* -name '*.fish')
#  . $preload
#end
for preload in env.fish git-aliases.fish
  . $fish_path/load/$preload
end

abbreviate 'h=~'
alias !!   "sudo su"
alias tf   "tail -f"
alias l    'ls -lah'
alias l.   'ls -d .*'
alias ll   'ls -lh'
abbreviate 'subl=subl3'

# abbreviate '!=sudo'
abbreviate 'b=bundle'
abbreviate 'be=bundle exec'
abbreviate 's=subl3'
abbreviate 'v=vim'
abbreviate 'gv=gvim --remote-tab-silent'
abbreviate 'a=ag --smart-case --literal'
abbreviate 'p=pacaur'

set -g fish_color_host blue

function fish_user_key_bindings
  # bind \e1 ".runsudo"
  bind \cs ".runsudo"
end

set -g fish_new_pager 1
