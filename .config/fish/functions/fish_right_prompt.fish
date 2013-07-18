function fish_right_prompt
  # Host
  set_color $fish_color_host
  echo -n "@"(hostname)
  set_color normal
end
