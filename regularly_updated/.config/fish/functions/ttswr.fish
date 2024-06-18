function ttswr
  echo (date -I'date'),(ttsw | tail -n 1 | cut -f1 -d" ") >> ~/.task/completed_in_past_week $argv;
end
