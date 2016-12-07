function install-ruby --wraps=ruby-install -a "type" -a "ruby_version"
  echo "installing $type $ruby_version"
  if test (which rbenv)
    command ruby-install --rubies-dir ~/.rbenv/versions $argv
  else if test (which rvm)
    command ruby-install --rubies-dir ~/.rvm/rubies $argv
  else
    command ruby-install $argv
  end
end

