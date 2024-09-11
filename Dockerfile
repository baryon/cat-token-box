FROM node:20

ENV TIME_ZONE=Asia/Shanghai
ENV TZ=Asia/Shanghai

WORKDIR /app

# 复制 package.json 文件
COPY package.json yarn.lock ./
COPY apps/cli/package.json ./apps/cli/
COPY packages/cat-smartcontracts/package.json ./packages/cat-smartcontracts/

# 安装依赖
RUN yarn install

# 复制所有源代码
COPY . .

# 构建所有包
RUN yarn workspaces run build
EXPOSE 4000
# CMD ["yarn", "start:prod"]
