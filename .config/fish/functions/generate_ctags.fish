function generate_ctags
  ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=coverage --exclude=tmp .
end
