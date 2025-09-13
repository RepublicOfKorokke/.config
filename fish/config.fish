function fish_greeting
    echo TTY: (set_color yellow)(tty)(set_color normal)
end

zoxide init fish | source

# set aliases
abbr -a ai " ollama run (ollama list | tail -n +2 | fzf --prompt='Select a model: ' | awk '{print \$1}')"
abbr -a b " bat"
abbr -a bn " bat --paging=never"
abbr -a bd " bd"
abbr -a c " cdh"
abbr -a cd " cd"
abbr -a cdd " cd ../"
abbr -a d " dirh"
abbr -a fdu " du -hs (find . -maxdepth 1 -type d | fzf)"
abbr -a l " lazygit"
abbr -a ll " gls --color --group-directories-first -AlhFX"
abbr -a ls " gls --color"
abbr -a mermaid " fd -e md | fzf | xargs -I {} podman run --userns keep-id --user (id -u) --rm -v "$PWD":/data:z ghcr.io/mermaid-js/mermaid-cli/mermaid-cli -s 8 -i {} -o output.png"
abbr -a n " nvim"
abbr -a nn " nvim -c ':tabnew term://fish | stopinsert | tabmove 0 | tabnext'"
abbr -a p " python"
abbr -a tf " tail -f"
abbr -a z " z"
abbr -a zi " zi"

# set enviroment variables
set -Ux LS_COLORS "$(vivid generate molokai)"
set -Ux FZF_LEGACY_KEYBINDINGS 0
set -Ux FZF_DEFAULT_OPTS "--bind 'backward-eof:abort,ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all' --reverse --height=75%"
set -Ux FZF_DEFAULT_COMMAND 'rg -uu --files --hidden --glob "!.git"'

# bind shortcut keys
# bind \cq 'fzf_change_env'
bind \cr 'fzf_command_history'
bind \ct 'fzf_preview_dir'
bind \cy 'fcd'

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
