function twsd --wraps='t "end>$(date -v-1d -I)" completed' --description 'alias tst=t "end>$(date -v-1d -I)" completed'
  t "end>$(date -I)" completed;
end
