# 使用 Node 的官方基础镜像
FROM node:latest

# 设置工作目录
WORKDIR /usr/src/app

# 复制 package.json 和 yarn.lock 到工作目录
COPY package*.json yarn.lock ./

# 安装项目依赖
RUN yarn install

# 复制所有本地文件到工作目录
COPY . .

# 运行构建命令
RUN yarn build
