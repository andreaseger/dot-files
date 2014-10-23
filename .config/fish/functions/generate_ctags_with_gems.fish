function generate_ctags_with_gems
  ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=coverage --exclude=tmp . (bundle list --paths)
end
