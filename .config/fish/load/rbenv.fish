#setup rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
status --is-interactive; and . (rbenv init -|psub)

