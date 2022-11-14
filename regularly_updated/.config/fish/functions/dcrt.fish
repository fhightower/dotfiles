function dcrt
  docker compose run --service-ports --rm test || docker compose run --service-ports --rm tests
end
