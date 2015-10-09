function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  set_color $fish_color_host
  echo -n (date +'%R')

  if test $USER = root
    set_color $fish_color_cwd_root
    echo -n (whoami)
    set_color normal
    echo -n ' '
  end

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __fish_git_prompt_new
  #__informative_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  echo -n '> '
  set_color normal
end
