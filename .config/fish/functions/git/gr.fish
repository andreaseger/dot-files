function gr --description "Move to the top level of the current git repo"
  cd (git rev-parse --show-toplevel);
end
