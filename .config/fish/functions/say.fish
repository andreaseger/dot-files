function say --description "say something via espeak"
  command espeak -v english-us "$argv"
end
