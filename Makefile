REDIS_VERSION=7.4.2
CADDY_VERSION=2.9.1
VALKEY_VERSION=8.0.2

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

.PHONY: valkey-sentinel
valkey-sentinel:
	docker build valkey-sentinel \
		--build-arg VERSION=${VALKEY_VERSION} \
		-f valkey-sentinel/Dockerfile \
		-t rhiaqey/valkey:dev \
		-t rhiaqey/valkey:latest \
		-t rhiaqey/valkey:${VALKEY_VERSION} \
		--progress plain \
		--no-cache \
		--squash

prod: redis redis-sentinel valkey valkey-sentinel
