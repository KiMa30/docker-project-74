setup: install db-migrate

install:
	npm install

db-migrate:
	npm run migrate

build:
	npm run build

prepare-env:
	cp -n .env.example .env

start:
	NODE_ENV=production npm run start

dev:
	npx concurrently "make start-frontend" "make start-backend"

start-backend:  # Убираем '--watch', так как оне нужен для локальной разработки и ведет к зависанию ci
	npm start

start-frontend:  # Убираем '--watch', так как оне нужен для локальной разработки и ведет к зависанию ci
	npx webpack --progress

lint:
	npx eslint .

lint-fix:
	npx eslint --fix .

test:
	NODE_ENV=test npm test -s

ci:    # Запуск тестов с использованием docker-compose (убрали docker-compose -f ../docker-compose.yml up --abort-on-container-exit --exit-code-from app)
	docker-compose -f ../docker-compose.yml up --abort-on-container-exit --exit-code-from app

