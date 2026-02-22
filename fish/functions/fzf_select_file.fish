function fzf_select_file
    set -l current_dir "."

    while true
        set -l selected (gls --group-directories-first -aF "$current_dir" | fzf --prompt="Select > ")

        if test -z "$selected"
            commandline --function repaint
            return
        end

        set -l clean_selected (string replace -r '[*/=>@|]$' '' -- "$selected")
        set -l target_path (path resolve "$current_dir/$clean_selected")
        set -l relative_path (grealpath --relative-to=$PWD "$target_path")

        if test "$clean_selected" = "." -o -f "$relative_path"
            commandline -i (string escape -- "$relative_path")
            commandline --function repaint
            break
        else if test -d "$relative_path"
            set current_dir "$relative_path"
        end
    end
end
