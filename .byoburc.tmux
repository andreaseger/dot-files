bind-key -n M-Left resize-pane -L
bind-key -n M-Right resize-pane -R
bind-key -n M-Up resize-pane -U
bind-key -n M-Down resize-pane -D

bind-key -n M-F2 display-panes \; split-window -h
bind-key -n M-F1 display-panes \; split-window -v

bind-key -n M-i display-panes \; select-pane -U
bind-key -n M-k display-panes \; select-pane -D
bind-key -n M-j display-panes \; select-pane -L
bind-key -n M-l display-panes \; select-pane -R

source "$HOME/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
