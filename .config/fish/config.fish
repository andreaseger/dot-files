set fish_path ~/.config/fish

for preload in (ls $fish_path/load)
  . $fish_path/load/$preload
end

abbreviate !    'sudo'
abbreviate tf   'tail -f'
shortcut l    'ls -lah'
shortcut l.   'ls -d .*'
shortcut ll   'ls -lh'

shortcut b 'bundle '
shortcut be 'bundle exec '