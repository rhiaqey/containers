REDIS_VERSION=7.2.4

.PHONY: redis
redis:
	docker build redis \
		--build-arg REDIS_VERSION=${REDIS_VERSION} \
		-f redis/Dockerfile \
		-t rhiaqey/redis:latest \
		--squash

.PHONY: push
push:
	docker push rhiaqey/redis:latest
	docker push rhiaqey/redis-sentinel:latest

.PHONY: redis-sentinel
redis-sentinel:
	docker build redis-sentinel \
		--build-arg REDIS_VERSION=${REDIS_VERSION} \
		-f redis-sentinel/Dockerfile \
		-t rhiaqey/redis-sentinel:latest \
		--squash

prod: redis redis-sentinel push
