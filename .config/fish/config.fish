set fish_path ~/.config/fish

for preload in (ls $fish_path/load)
  . $fish_path/load/$preload
end

