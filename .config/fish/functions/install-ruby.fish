function install-ruby --wraps=ruby-install -a "type" -a "ruby_version"
  echo "installing $type $ruby_version"
  if test (which rbenv)
    command ruby-install --rubies-dir ~/.rbenv/versions $argv --no-install-deps --cleanup --jobs -- --disable-install-rdoc
    set -x RBENV_VERSION $type-$ruby_version
    echo "-- post install steps --"
    command ruby -v
    command gem update --system
    command gem install bundler
    set -e RBENV_VERSION
  else
    command ruby-install $argv --no-install-deps --cleanup --jobs -- --disable-install-rdoc
  end
end

