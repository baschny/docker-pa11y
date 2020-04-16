build:
	docker-compose build

run:
	docker-compose up -d

logs:
	docker-compose logs -f dashboard
