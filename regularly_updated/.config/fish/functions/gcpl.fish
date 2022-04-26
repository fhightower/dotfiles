function gcp --wraps='gch && git pull' --description 'alias gcp gch && git pull'
  gch;
  git pull;
end
