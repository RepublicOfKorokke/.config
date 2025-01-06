function fzf_grep
    set -f cmd 'rg --color=always --line-number --no-heading --smart-case "\$"'
    if test -n $FZF_DEFAULT_COMMAND
        if string match --quiet -r -- '-uu' "$FZF_DEFAULT_COMMAND"
            set -f cmd 'rg --color=always --line-number --no-heading --smart-case -u "\$"'
        end
    end

    set selected_file_name (
        # {1} is filename, {2} is selected line in rg command
        eval $cmd |
        fzf-tmux -p -w 100% -h 80% -h \
            --ansi \
            --delimiter : \
            --prompt="$cmd > " \
            --preview 'bat --color=always --highlight-line {2} --line-range :50 {1}' \
            #--preview "echo 1: {1} 2: {2}" \
        | string split ":"
    )[1] # [1] is file name, [2] is line, [3] is text of [1][2]

    commandline -i "$selected_file_name"
    commandline --function repaint
end
