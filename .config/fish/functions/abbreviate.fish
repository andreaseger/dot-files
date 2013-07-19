function abbreviate
  if set -q fish_user_abbreviations
    set fish_user_abbreviations $fish_user_abbreviations $argv
  else
    set -U fish_user_abbreviations $argv
  end
end
