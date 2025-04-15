ARG NODE_VERSION=23-slim

FROM node:${NODE_VERSION}

LABEL MAINTAINER="yujindong <yujindong1985@gmail.com>"

# 设置工作目录
WORKDIR /app

# 安装pnpm
RUN npm install -g pnpm@latest

# 验证安装
RUN node --version && \
    npm --version && \
    pnpm --version

# 设置pnpm存储路径，优化容器内使用
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN mkdir -p $PNPM_HOME

# 可选：设置一些pnpm默认配置
RUN pnpm config set store-dir /pnpm/store

# 默认命令
CMD ["node"]