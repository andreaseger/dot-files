if test -d $HOME/go
  set -x GOPATH $HOME/go
  set -x GOBIN $GOPATH/bin
  .add_uniquely_to_user_paths $GOBIN
end
