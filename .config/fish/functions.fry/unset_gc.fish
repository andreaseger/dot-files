function unset_gc
  set --erase RUBY_HEAP_MIN_SLOTS
  set --erase RUBY_GC_MALLOC_LIMIT
  set --erase RUBY_HEAP_FREE_MIN
end
