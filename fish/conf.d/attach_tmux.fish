function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session -s Main
        return
    end

    set ID (tmux list-sessions | grep -vi "popup" | fzf | cut -d: -f1)
    if test "$ID" = ""
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end
