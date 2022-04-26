function gcl
  # hacky, but it works ;)
  set repo_name (echo $argv | rev | cut -d "/" -f1 | rev | cut -d "." -f1)
  git clone $argv && cd $repo_name; 
end
