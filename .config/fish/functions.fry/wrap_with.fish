function wrap_with
  . $argv[1]
  eval $argv[2..-1]
end
