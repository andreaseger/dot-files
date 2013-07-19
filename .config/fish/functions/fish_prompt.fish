function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  if test $USER = root
    set_color $fish_color_cwd_root
    echo -n (whoami)
    set_color normal
    echo -n ' '
  end

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __informative_git_prompt

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '> '
  set_color normal
end
