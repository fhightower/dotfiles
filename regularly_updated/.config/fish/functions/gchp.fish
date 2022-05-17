function gchp --wraps='git checkout' --description 'alias gch git checkout'
  gch $argv; 
  gpl;
end
