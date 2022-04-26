function gc --wraps='git clone' --description 'alias gc git clone'
  set repo_name (echo $argv | cut -d "/" -f5 | cut -d "." -f1)
  git clone $argv && cd $repo_name; 
end
