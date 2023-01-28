# BRANCH=7.0.8
# BITNAMI_TAG=7.0.8-debian-11-r0
export BRANCH = ${VERSION}

.PHONY: compile
compile:
	git clone --depth 1 --branch ${BRANCH} https://github.com/redis/redis.git tmp/redis-${BRANCH}
	cd tmp/redis-${BRANCH} && \
		make MALLOC=jemalloc

.PHONY: docker-build
docker-build:
	docker build \
		--build-arg TAG=${BITNAMI_TAG} \
		--build-arg VERSION=${BRANCH} \
			--no-cache -t ${DOCKER_REGISTRY}/redis:${BITNAMI_TAG} .

.PHONY: docker-clean
docker-clean:
	docker rmi ${DOCKER_REGISTRY}/redis:${BITNAMI_TAG} || echo image does not exist

.PHONY: docker-run
docker-run:
	docker run --rm -it -p 6379:6379 \
		-e REDIS_PASSWORD=password \
		${DOCKER_REGISTRY}/redis:${BITNAMI_TAG}
 