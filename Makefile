update:
	@ hz update -idl ./idl/api.thrift
.PHONY: env-up
env-up:
	@ docker compose -f ./docker-compose.yml up -d

.PHONY: env-down
env-down:
	@  docker compose down

.PHONY: build
build:
	@ docker bulid -f ./Dockerfile -t bulebook .

.PHONY: run
run:
	@ docker run -d -p 8080:8080 bulebook --network bulebook

.PHONY: stop
stop:
	@ docker rm -f bulebook & docker rmi -f bulebook:latest
