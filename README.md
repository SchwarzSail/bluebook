# bluebook

### 环境搭建（后端）
```shell
make env-up
```

### 本地运行
```shell
go mod tidy
make local
```

### 项目目录
```shell
.
├── Dockerfile
├── Makefile
├── README.md
├── app
├── biz
│   ├── handler
│   │   ├── api
│   ├── middleware
│   │   └── jwt.go
│   ├── model
│   │   ├── api
│   │   ├── model
│   │   └── user.go
│   ├── pack
│   └── router
│       ├── api
│       │   ├── api.go
│       │   └── middleware.go
│       └── register.go
├── build.sh
├── config
│   ├── config.go
│   ├── config.yaml
│   └── sql
├── dal
│   ├── db
│   └── init.go
├── docker-compose.yml
├── go.mod
├── go.sum
├── idl
├── main.go
├── pkg
│   ├── constants
│   ├── errno
│   ├── logger
│   └── util
├── router.go
├── router_gen.go
├── script
└── service
    ├── project
    └── user
```
- biz: 业务逻辑层
- dal: 数据访问层
- pkg: 通用工具
- service: 服务层
- app: 前端部分
- idl: 接口定义