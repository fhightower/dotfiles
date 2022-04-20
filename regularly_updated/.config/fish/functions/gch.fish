function gch --wraps='git checkout main || git checkout master' --description 'alias gch git checkout main || git checkout master'
  git checkout main || git checkout master; 
end
