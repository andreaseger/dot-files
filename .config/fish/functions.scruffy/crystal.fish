function crystal --description "crystal-lang"
  command docker run --rm -w /app  -v (pwd):/app crystallang/crystal:latest crystal $argv
end