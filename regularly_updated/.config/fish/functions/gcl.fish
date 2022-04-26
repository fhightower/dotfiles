function gcl --wraps='git clone' --description 'alias gcl git clone'
  set repo_name (echo $argv | cut -d "/" -f5 | cut -d "." -f1)
  git clone $argv && cd $repo_name; 
end
