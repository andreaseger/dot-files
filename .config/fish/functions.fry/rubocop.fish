function rubocop
  command env RBENV_VERSION=ruby-2.1.2 rubocop -D $argv
  #if test (which rubocop)
  #  command rubocop -D $argv
  #else
  #  command env RBENV_VERSION=ruby-2.1.2 rubocop -D $argv
  #end
end
