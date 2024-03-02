REDIS_VERSION=7.2.4
CADDY_VERSION=2.7.6

.PHONY: redis
redis:
	docker build redis \
		--build-arg VERSION=${REDIS_VERSION} \
		-f redis/Dockerfile \
		-t rhiaqey/redis:dev \
		-t rhiaqey/redis:latest \
		-t rhiaqey/redis:${REDIS_VERSION} \
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
		--squash

.PHONY: caddy
caddy:
	docker build \
		--build-arg VERSION=${CADDY_VERSION} \
		-f caddy/Dockerfile \
		-t rhiaqey/caddy:dev \
		-t rhiaqey/caddy:latest \
		-t rhiaqey/caddy:${CADDY_VERSION} \
		--progress plain \
		--no-cache \
		--squash \
		caddy

.PHONY: run-caddy
run-caddy:
	docker run -it --rm --name caddy -p 8080:8080 -p 8443:443 rhiaqey/caddy:dev

prod: redis redis-sentinel push
