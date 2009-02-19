function fish_prompt --description 'Write out the prompt'
  # Write the process working directory
  if test -w "."
    printf '%s%s ' (set_color -o $fish_color_cwd) (prompt_pwd)
  else
    printf '%s%s ' (set_color -o $fish_color_uneditable_cwd) (prompt_pwd)
  end
  
  printf '%s%s%s' (set_color $fish_color_git_branch) (current_git_branch) (set_color normal)
  
  printf '%s$%s ' (set_color -o $fish_color_cwd) (set_color normal)
  
end
