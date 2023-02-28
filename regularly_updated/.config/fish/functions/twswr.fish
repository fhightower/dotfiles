function twswr
  echo (date -I'date'),(twsw | tail -n 1 | cut -f1 -d" ") >> ~/.task/completed_in_past_week $argv;
end
