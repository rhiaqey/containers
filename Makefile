REDIS_VERSION=7.2.4
CADDY_VERSION=2.7.6
VALKEY_VERISON=7.2.4

.PHONY: redis
redis:
	docker build redis \
		--build-arg VERSION=${REDIS_VERSION} \
		-f redis/Dockerfile \
		-t rhiaqey/redis:dev \
		-t rhiaqey/redis:latest \
		-t rhiaqey/redis:${REDIS_VERSION} \
		--progress plain \
		--no-cache \
		--squash

.PHONY: push
push:
	docker push rhiaqey/caddy:dev
	docker push rhiaqey/redis:dev
	docker push rhiaqey/redis-sentinel:dev

.PHONY: redis-sentinel
redis-sentinel:
	docker build redis-sentinel \
		--build-arg VERSION=${REDIS_VERSION} \
		-f redis-sentinel/Dockerfile \
		-t rhiaqey/redis-sentinel:dev \
		-t rhiaqey/redis-sentinel:latest \
		-t rhiaqey/redis-sentinel:${REDIS_VERSION} \
		--progress plain \
		--no-cache \
		--squash

.PHONY: caddy
caddy:
	docker build caddy \
		--build-arg VERSION=${CADDY_VERSION} \
		-f caddy/Dockerfile \
		-t rhiaqey/caddy:dev \
		-t rhiaqey/caddy:latest \
		-t rhiaqey/caddy:${CADDY_VERSION} \
		--progress plain \
		--no-cache \
		--squash

.PHONY: run-caddy
run-caddy:
	docker run -it --rm --name caddy -p 8080:8080 -p 8443:443 rhiaqey/caddy:dev

.PHONY: valkey
valkey:
	docker build valkey \
		--build-arg VERSION=${VALKEY_VERISON} \
		-f valkey/Dockerfile \
		-t rhiaqey/valkey:dev \
		-t rhiaqey/valkey:latest \
		-t rhiaqey/valkey:${VALKEY_VERISON} \
		--progress plain \
		--no-cache \
		--squash

prod: redis redis-sentinel push
