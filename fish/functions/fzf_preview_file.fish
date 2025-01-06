function fzf_preview_file
    set selected (
      fzf-tmux -p -w 100% -h 80% -h \
          --ansi \
          --delimiter : \
          --multi \
          --prompt="Preview File > " \
          --preview 'bat --style=numbers --color=always --line-range :50 {}' \
          #--preview "echo 1: {1} 2: {2}" \
    )

    commandline -i "$selected"
    commandline --function repaint
end
