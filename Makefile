bash:
	docker-compose run --rm api_rest /bin/bash

setup:
	docker network create rabbitmq_network || true
	docker-compose build --target dev
	docker-compose run --rm api_rest bash -c "bundler install && rails db:create db:migrate db:seed"

run:
	docker-compose up

down:
	docker-compose down --remove-orphans