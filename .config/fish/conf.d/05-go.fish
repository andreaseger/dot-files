if test -d $HOME/code/go
  set -x GOPATH $HOME/code/go
  set -x GOBIN $GOPATH/bin
  __add_uniquely_to_user_paths $GOBIN
end
