REDIS_VERSION=7.2.4

.PHONY: redis
redis:
	docker build redis \
		--build-arg VERSION=${REDIS_VERSION} \
		-f redis/Dockerfile \
		-t rhiaqey/redis:latest \
		-t rhiaqey/redis:${REDIS_VERSION} \
		--squash

.PHONY: push
push:
	docker push rhiaqey/redis:latest
	docker push rhiaqey/redis:${REDIS_VERSION}
	docker push rhiaqey/redis-sentinel:latest
	docker push rhiaqey/redis-sentinel:${REDIS_VERSION}

.PHONY: redis-sentinel
redis-sentinel:
	docker build redis-sentinel \
		--build-arg VERSION=${REDIS_VERSION} \
		-f redis-sentinel/Dockerfile \
		-t rhiaqey/redis-sentinel:latest \
		-t rhiaqey/redis-sentinel:${REDIS_VERSION} \
		--squash

prod: redis redis-sentinel push
