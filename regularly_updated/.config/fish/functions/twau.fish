function twau --wraps='task add until:today+6m' --description 'alias tau task add until:today+6m'
  task add until:today+6m $argv;
end
