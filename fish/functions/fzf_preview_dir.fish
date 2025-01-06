function fzf_preview_dir
    set selected (
      find . -type d |
      fzf-tmux -p -w 100% -h 80% -h \
          --ansi \
          --delimiter : \
          --multi \
          --prompt="Preview Directory > " \
          --preview 'gls --color -AlhFX {}' \
          #--preview "echo 1: {1} 2: {2}" \
    )

    commandline -i "$selected"
    commandline --function repaint
end
