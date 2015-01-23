abbreviate 'server=bundle exec rails server'
abbreviate 'console=bundle exec rails console'

set -x JRUBY_OPTS "--1.9 -Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF"

# TODO: find a better place to set these
# this is only really needed for runtastic-web
set -x RUBY_GC_HEAP_INIT_SLOTS 600000
set -x RUBY_GC_MALLOC_LIMIT 59000000
set -x RUBY_HEAP_FREE_MIN 100000

. $fish_path/load/rbenv.fish

abbreviate 'spec=bundle exec rspec spec'
abbreviate 'vi=nvim'
abbreviate 'vim=nvim'
