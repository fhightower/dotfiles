function liigo
  tmux new-session -s "crs" -d -c "$HOME/code/work/call-recording-system" 'bash -c "source .env && npm run dev"';

  tmux new-session -s "alice" -d -c "$HOME/code/work/alice" 'fish -c "pva && cd alice/ && pm runserver 127.0.0.1:5555"';
  tmux splitw -h -t "alice" -d 'fish -c "ngrok start alice_dev"';

  tmux new-session -s "liime" -d -c "$HOME/code/work/liime" 'bash -c "source .env && go run ."';

  tmux new-session -s "scoring" -d -c "$HOME/code/work/scoring" 'fish -c "pva && pm runserver"';
  tmux splitw -h -t "scoring" -d -c "$HOME/code/work/scoring" 'fish -c "pva && yarn start"';
end
