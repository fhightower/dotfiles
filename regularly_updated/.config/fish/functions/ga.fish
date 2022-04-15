function ga --wraps='git add ' --wraps='git add -A  && gs' --description 'alias ga git add '
  git add  $argv; 
end
