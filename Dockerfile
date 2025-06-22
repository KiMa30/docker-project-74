FROM node:20.12.2
WORKDIR /app

# Установка глобальных зависимостей
RUN npm install -g sequelize-cli@6.6.2 webpack-cli@5.1.4

# Важно для кеширования слоев
COPY app/package.json package.json
COPY app/package-lock.json package-lock.json

RUN npm ci

COPY app/. .

EXPOSE 8080
ENV NODE_ENV=development
RUN make build

CMD ["make", "dev"]