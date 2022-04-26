function gcpl --wraps='gch && git pull' --description 'alias gcpl gch && git pull'
  gch;
  git pull;
end
