# 第一阶段：构建应用程序
FROM golang:1.23 AS builder
# 设置环境变量
ENV TZ Asia=Shanghai
ENV GO111MODULE=on
ENV CGO_ENABLED=0
ENV GOPROXY=https://goproxy.cn,direct
ENV GOOS=linux
ENV GOARCH=amd64
# 创建工作目录
RUN mkdir -p /app
RUN mkdir -p /app/output


WORKDIR /app

# 复制所有文件到工作目录
COPY . .

# 下载依赖
RUN go mod tidy


# 编译应用程序
RUN sh ./build.sh

# 第二阶段：创建最终运行环境
FROM alpine

ARG SERVICE

ENV TZ Asia=Shanghai
# 安装必要的依赖
RUN apk --no-cache add ca-certificates

# 创建工作目录
WORKDIR /app

# 从构建阶段复制应用程序二进制文件和配置文件
COPY --from=builder /app/config /app/config
COPY --from=builder /app/output /app/output

RUN sudo chmod +x /app/output/bootstrap.sh

CMD ["sh", "-c", "./output/bootstrap.sh"]


