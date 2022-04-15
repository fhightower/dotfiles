function dcrd
  docker-compose run --service-ports --rm dev || docker-compose run --service-ports --rm devbox
end
