REDIS_VERSION=7.4.0
CADDY_VERSION=2.8.4
VALKEY_VERSION=7.2.6

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
		--build-arg VERSION=${VALKEY_VERSION} \
		-f valkey/Dockerfile \
		-t rhiaqey/valkey:dev \
		-t rhiaqey/valkey:latest \
		-t rhiaqey/valkey:${VALKEY_VERSION} \
		--progress plain \
		--no-cache \
		--squash

prod: redis redis-sentinel
