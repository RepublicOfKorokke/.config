function tmux_popup -d "toggle tmux popup window"
  set width '80%'
  set height '80%'
  set name "popup"
  set session (tmux display-message -p -F "#{session_name}")
  if contains $name $session
    tmux detach-client
  else
    tmux popup -d '#{pane_current_path}' -w$width -h$height -E "tmux attach -t $name || tmux new -s $name"
    # does not work "or" instead of "||". maybe tmux popup not run fish on starup?
  end
end
