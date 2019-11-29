function fish_right_prompt
  set -l size (stty size | cut -d" " -f2)
  if test $size -gt 100
    if test (which rbenv)
      set_color $fish_color_ruby
      echo -n (rbenv version | cut -d' ' -f1)
    end
    # Host
    set_color $fish_color_host
    echo -n "@"(hostname)
    set_color normal
  end
end
