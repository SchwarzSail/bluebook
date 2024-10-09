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
