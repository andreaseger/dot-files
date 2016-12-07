function install-ruby --wraps=ruby-install -a "type" -a "ruby_version"
  echo "installing $type $ruby_version"
  if test (which rbenv)
    command ruby-install --rubies-dir ~/.rbenv/versions $argv -- --disable-install-rdoc
  else if test (which rvm)
    command ruby-install --rubies-dir ~/.rvm/rubies $argv -- --disable-install-rdoc
  else
    command ruby-install $argv -- --disable-install-rdoc
  end
end

