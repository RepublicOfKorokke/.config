function fzf_git_diff
    set -f from_commit (git log --oneline --decorate -100 --color=always | \
        fzf \
            --ansi \
            --header "> difit \$TO \$FROM~1" \
            --prompt "Select \$FROM>" \
            --preview 'git log --oneline --decorate --color=always -1 {1}' \
            --preview-window=top:3:wrap
    )
    or return

    set -f from_hash (string split ' ' $from_commit)[1]

    set -f to_commit (git log --oneline --decorate -100 --color=always "$from_hash~1.." | \
        fzf \
            --ansi \
            --header "> difit \$TO $from_hash~1" \
            --prompt "Select \$TO>" \
            --preview 'git log --oneline --decorate --color=always -1 {1}' \
            --preview-window=top:3:wrap
    )
    or return

    set -f to_hash (string split ' ' $to_commit)[1]

    set -f DIFF_OPTION \
        "git diff" \
        "git log -p"

    set -f diff_command (
        printf '%s\n' $DIFF_OPTION |
            fzf \
                --ansi \
                --prompt="Select target > "
    )
    or return

    if test "$diff_command" = "git log -p"
        commandline -r " git log -p $from_hash^..$to_hash"
    else
        commandline -r " git diff $from_hash^ $to_hash"
    end
end
