function rails_s
# faster GC for ree
  set -l RUBY_HEAP_MIN_SLOTS 1000000
  set -l RUBY_GC_MALLOC_LIMIT 400000000
  set -l RUBY_HEAP_FREE_MIN 500000
  command bundle exec rails server
end

