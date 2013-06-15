set fish_greeting ""

set fish_path ~/.config/fish

for preload in (ls $fish_path/load)
  . $fish_path/load/$preload
end

function fish_user_key_bindings
  bind \  '__fish_expand_abbreviation; commandline -i " "'
  bind \n '__fish_expand_abbreviation; commandline -f execute'
end

abbreviate !    "sudo"
abbreviate tf   "tail -f"
abbreviate l    'ls -lah'
abbreviate l.   'ls -d .*'
abbreviate ll   'ls -lh'

abbreviate b    'bundle'
abbreviate be   'bundle exec'

alias subl subl3
abbreviate s 'subl3'

abbreviate h '~'


function terminal_server
  rdesktop -g 1440x900 -P -z -x l -u aeger@experteer.muc 192.168.100.241
end

function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __informative_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n ' $ '

end
