function shards --description "crystal shards"
  command docker run --rm -w /app  -v (pwd):/app crystallang/crystal:latest shards $argv
end