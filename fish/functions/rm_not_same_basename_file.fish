function rm_not_same_basename_file

  argparse -n rm_not_same_basename_file 'b/base_extention=' 'c/compare_extention=' 'd/dir=' -- $argv
  or return 1

  if set -lq _flag_base_extention
    echo "Base extention (delete larget):" $_flag_base_extention
  else
    echo "You need to specify base extention"
    return 1
  end

  if set -lq _flag_compare_extention
    echo "Compared to extention:" $_flag_compare_extention
  else
    echo "You need to specify compare extention"
    return 1
  end

  if set -lq _flag_dir
    echo "Comapred to dir:" $_flag_dir
  else
    echo "You need to specify dir"
    return 1
  end

  read -p 'echo "are you sure? (y/N): "' -l yn
  switch $yn
    case Y y
      ;;
    case '*'
      echo "abort."
      return 1 ;;
  end

  mkdir -p deleted

  for i in *.$_flag_base_extention
    set baseFileName (basename $i .$_flag_base_extention)
    if test ! -f $_flag_dir/$baseFileName.$_flag_compare_extention
      echo remove $baseFileName.$_flag_base_extention
      mv $baseFileName.$_flag_base_extention deleted/
    end
  end
end
