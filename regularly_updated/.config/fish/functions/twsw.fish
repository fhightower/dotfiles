function twsw --wraps='t "end>$(date -v-7d -I)" completed' --description 'alias twsw=t "end>$(date -v-7d -I)" completed'
  t "end>$(date -v-7d -I)" completed $argv; 
end
