if test -d $HOME/go
  set -x GOPATH $HOME/go
  set -x GOBIN $GOPATH/bin
  fish_add_path -U $GOBIN
end
