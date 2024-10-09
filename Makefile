update:
	@ hz update -idl ./idl/api.thrift -module bluebook
.PHONY: env-up
env-up:
	@ docker compose -f ./docker-compose.yml up -d

.PHONY: env-down
env-down:
	@  docker compose down

.PHONY: build
build:
	@ docker build  -t bluebook .

.PHONY: run
run:
	@ docker run -d -p 8080:8080 bluebook --network bluebook

.PHONY: stop
stop:
	@ docker rm -f bluebook & docker rmi -f bluebook:latest

 .PHONY: local
local:
	sh build.sh && sh output/bootstrap.sh


# 格式化代码，我们使用 gofumpt，是 fmt 的严格超集
.PHONY: fmt
fmt:
	gofumpt -l -w .

# 优化 import 顺序结构
.PHONY: import
import:
	goimports -w  .

# 检查可能的错误
.PHONY: vet
vet:
	go vet ./...

# 代码格式校验
.PHONY: lint
lint:
	golangci-lint run --config=./.golangci.yml

# 一键修正规范并执行代码检查
.PHONY: verify
verify: vet fmt import lint
