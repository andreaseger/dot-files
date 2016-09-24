function install-ruby
  if test (which rbenv)
    command ruby-install --rubies-dir ~/.rbenv/versions $argv
  else if test (which rvm)
    command ruby-install --rubies-dir ~/.rvm/rubies $argv
  else
    command ruby-install ruby $argv
  end
end

