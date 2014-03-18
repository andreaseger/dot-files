function fish_right_prompt
  set -l size (stty size | cut -d" " -f2)
  if test $size -gt 100
    # Host
    set_color $fish_color_host
    echo -n "@"(hostname)
    set_color normal
  end
end
