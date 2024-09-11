FROM node:20

ENV TIME_ZONE=Asia/Shanghai
ENV TZ=Asia/Shanghai

RUN apt update
RUN apt install vim -y
RUN npm i -g pnpm@9.10.0
RUN npm i -g ts-node typescript

WORKDIR /app

COPY . .

RUN pnpm install
RUN pnpm build

EXPOSE 4000
# CMD ["pnpm", "start:prod"]
