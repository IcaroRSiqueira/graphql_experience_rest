bash:
	docker-compose run --rm api_rest /bin/bash

setup:
	docker-compose build --target dev
	docker-compose run --rm api_rest bash -c "bundler install && rails db:create db:migrate db:seed"

run:
	docker-compose run --service-ports --rm api_rest /bin/bash -c "bin/rails s -b 0.0.0.0 -p 3001"

down:
	docker-compose down --remove-orphans