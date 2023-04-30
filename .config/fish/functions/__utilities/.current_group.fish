function .current_group -d "print primary group of current user"
  command id -g -n $USER
end
