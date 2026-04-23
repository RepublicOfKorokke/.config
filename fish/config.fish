function fish_greeting
    echo TTY: (set_color yellow)(tty)(set_color normal)
end

zoxide init fish | source

# set aliases
abbr -a b " bat"
abbr -a bn " bat --paging=never"
abbr -a bd " bd"
abbr -a btm " btm --disable_click --process_memory_as_value --enable_cache_memory "
abbr -a c " cdh"
abbr -a cd " cd"
abbr -a cdd " cd ../"
abbr -a d " dirh"
abbr -a fdu " du -hs (find . -maxdepth 1 -type d | fzf)"
abbr -a fcd " fcd"
abbr -a fdiff " fzf_git_diff"
abbr -a fkill " ps | fzf | awk '{print \$1}' | xargs kill -9"
abbr -a glow " glow"
abbr -a gpwd " git rev-parse --show-prefix"
abbr -a l " lazygit"
abbr -a ll " gls --color --group-directories-first -AlhFX"
abbr -a ls " gls --color"
abbr -a mermaid " fd -e md | fzf | xargs -I {} podman run --userns keep-id --user (id -u) --rm -v "$PWD":/data:z ghcr.io/mermaid-js/mermaid-cli/mermaid-cli -s 8 -i {} -o output.png"
abbr -a marp " fd -e md | fzf | xargs -I {}  podman run --rm --init --mount type=bind,source=(pwd),target=/home/marp/app/ docker.io/marpteam/marp-cli {} --pdf"
abbr -a n " nvim"
abbr -a nn " nvim -c ':tabnew term://fish | stopinsert | tabmove 0 | tabnext'"
abbr -a p " python"
abbr -a tf " tail -f"
abbr -a z " z"
abbr -a zi " zi"

# set enviroment variables
set -x EDITOR "nvim"
set -x LS_COLORS (vivid generate molokai)
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_OPTS "--bind 'backward-eof:abort,ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all' --reverse --height=75%"
set -x FZF_DEFAULT_COMMAND 'rg -uu --files --hidden --glob "!.git"'

# bind shortcut keys
# bind \cq 'fzf_change_env'
bind \cr 'fzf_command_history'
bind \cq 'fzf_select_file'

# auto load tmux session
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

function notify_long_command --on-event fish_postexec
    set -l duration (test -n "$CMD_DURATION"; and echo "$CMD_DURATION"; or echo 0)
    test $duration -lt 3000; and return

    set -l cmd_base (string split --no-empty " " -- $argv[1])[1]
    set -l exclude_list nvim vim vi man less top htop btop btm tail ssh bat lazygit
    if contains $cmd_base $exclude_list
        return
    end

    set -l cmd_name $argv[1]
    set -l finish_time (date "+%H:%M:%S")
    set -l title "$finish_time ("$duration"ms)"

    if type -q osascript
        osascript -e "display notification \"$cmd_name\" with title \"$title\" sound name \"Pop\""
    else if type -q notify-send
        notify-send -u critical "$title" "$cmd_name"
    end
end
