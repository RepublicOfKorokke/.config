function tmux_template
  tmux rename-window "main"
  tmux new-window; tmux rename-window "config"; tmux move-window -t 99
  tmux choose-window
end
