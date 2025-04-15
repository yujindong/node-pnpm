ARG NODE_VERSION
FROM node:${NODE_VERSION}

LABEL MAINTAINER="yujindong <yujindong1985@gmail.com>"


# 设置时区为中国标准时间
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装pnpm
RUN npm install -g pnpm

# 验证安装
RUN node --version && \
    npm --version && \
    pnpm --version

# 设置工作目录
WORKDIR /app

# 设置pnpm存储路径
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

CMD ["bash"]