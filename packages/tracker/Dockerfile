FROM node:20

WORKDIR /app

ARG FILE

RUN apt update
RUN apt install vim -y

RUN npm i -g ts-node

COPY . .
COPY ${FILE} .env

RUN yarn install
RUN yarn build

EXPOSE 4000
