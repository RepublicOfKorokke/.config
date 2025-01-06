function fcd
    set -l search_term $argv
    set -l selected_dir (fd $search_term | fzf | xargs -I {} dirname {} | head -n 1)
    if test -n "$selected_dir"
        cd $selected_dir
        echo "Changed directory to $selected_dir"
    else
        echo "No directory selected."
    end
end

