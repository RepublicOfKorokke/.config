function fzf_change_env
    set -f _FZF_DEFAULT_COMMAND 'FZF_DEFAULT_COMMAND'
    set -f _FZF_DEFAULT_OPTS 'FZF_DEFAULT_OPTS'

    set -f TARGET_LIST \
         "$_FZF_DEFAULT_COMMAND" \
         "$_FZF_DEFAULT_OPTS"

    set -f selected_target (
         printf '%s\n' $TARGET_LIST |
         fzf-tmux -p -w 100% -h 80% -h \
            --ansi \
            --prompt="Select target > " \
            --preview="set -S {}" \
    )

    if test "$selected_target" = "$_FZF_DEFAULT_COMMAND"
         set -f _FZF_DEFAULT_COMMAND_LIST \
             '\'rg --files --glob "!.git"\'' \
             '\'rg -uu --files --glob "!.git"\''

         set -f selected_command (
             printf '%s\n' $_FZF_DEFAULT_COMMAND_LIST |
             fzf-tmux -p -w 100% -h 80% -h \
                 --ansi \
                 --prompt="Select value > " \
    )
    end

    if test "$selected_target" = "$_FZF_DEFAULT_OPTS"
         set -f _FZF_DEFAULT_OPTS_LIST \
             '"--bind 'backward-eof:abort,ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all' --reverse --height=75%"'

         set -f selected_command (
             printf '%s\n' $_FZF_DEFAULT_OPTS_LIST |
             fzf-tmux -p -w 100% -h 80% -h \
                 --ansi \
                 --prompt="Select value > " \
    )
    end

    if string length --quiet $selected_command
        set -f result " set -Ux $selected_target $selected_command"
        commandline -i $result
        commandline --function repaint
    end
end
