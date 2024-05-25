# 阶段一: 构建
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN YARN_IGNORE_SCRIPTS=1 yarn
RUN yarn build:web

# 阶段二: 设置 Nginx
FROM nginx:latest
# 注意：你可能需要根据你的 Nginx 配置和构建的输出修改以下这行
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
