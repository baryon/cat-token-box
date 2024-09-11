FROM node:20

ENV TIME_ZONE=Asia/Shanghai
ENV TZ=Asia/Shanghai

RUN apt update
RUN apt install vim -y
RUN npm i -g ts-node typescript

WORKDIR /app

# 复制 package.json 文件
COPY package.json yarn.lock ./
COPY apps/cli/package.json ./apps/cli/

# 安装依赖
RUN yarn install

# 复制所有源代码
COPY . .

# 构建所有包
RUN yarn workspaces run build

WORKDIR /app/apps/tracker
RUN yarn build

EXPOSE 4000
CMD ["yarn", "start:prod"]
