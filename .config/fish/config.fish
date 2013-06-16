set fish_greeting ""

if status --is-login
  if which tmux 2>&1 >/dev/null
      #if not inside a tmux session, and if no session is started, start a new session
      if test -z "$TMUX"
        exec tmux attach
      end
  end
  if test -e ~/.local.fish
    . ~/.local.fish
  end
end

set fish_path ~/.config/fish

for preload in (ls $fish_path/load)
  . $fish_path/load/$preload
end

function fish_user_key_bindings
  bind \  '__fish_expand_abbreviation; commandline -i " "'
  bind \n '__fish_expand_abbreviation; commandline -f execute'
end

alias !    "sudo"
alias tf   "tail -f"
alias l    'ls -lah'
alias l.   'ls -d .*'
alias ll   'ls -lh'

alias b    'bundle'
abbreviate be   'bundle exec'

alias subl subl3
alias s 'subl3'

alias h '~'


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
