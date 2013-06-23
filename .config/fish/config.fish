set fish_greeting ""

#if status --is-login
#  if which tmux 2>&1 >/dev/null
#      #if not inside a tmux session, and if no session is started, start a new session
#      if test -z "$TMUX"
#        exec tmux attach
#      end
#  end
#end

set fish_path ~/.config/fish
set fish_function_path $fish_function_path (find $fish_path/functions/* -type d)
# load local config (stuff like PATH)
begin
  set -l fish_local_config $fish_path/config.(hostname).fish
  if test -e $fish_local_config
    . $fish_local_config
  end
  set -l fish_local_functions $fish_path/functions.(hostname)
  if test -e $fish_local_functions
    set fish_function_path $fish_function_path $fish_local_functions
  end
end
for preload in (ls $fish_path/load)
  . $fish_path/load/$preload
end

function fish_user_key_bindings
  bind \  '__fish_expand_abbreviation; commandline -i " "'
  bind \n '__fish_expand_abbreviation; commandline -f execute'
end

alias !    "sudo"
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

# fix perl-bin path for arch
if test -e /usr/bin/core_perl
  set PATH $PATH /usr/bin/core_perl/
end
