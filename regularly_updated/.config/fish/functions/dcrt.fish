function dcrt
  docker-compose run --rm test || docker-compose run --service-ports --rm tests
end
