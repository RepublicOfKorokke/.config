function fcd
    set -l search_term $argv
    set -l selected_dir (fd -I $search_term | fzf | xargs -I {} dirname {} | head -n 1)
    if test -n "$selected_dir"
        cd $selected_dir
        commandline -f repaint
    end
end
