function gaa --wraps='git add -A $argv && gs' --description 'alias gaa git add -A $argv && gs'
  git add -A $argv && gs; 
end
