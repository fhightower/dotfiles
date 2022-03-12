# Defined in - @ line 1
function gi --wraps='git init -b main' --description 'alias gi git init -b main'
  git init -b main $argv;
end
