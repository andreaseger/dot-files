function serve-this --argument-names "port"
  if test -z "$port"
    set port 5000
  end

  command ruby -run -e httpd . -p $port
end
