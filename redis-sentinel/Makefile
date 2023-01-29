export BRANCH = ${VERSION}

.PHONY: compile
compile:
	git clone --depth 1 --branch ${BRANCH} https://github.com/redis/redis.git tmp/redis-${BRANCH}
	cd tmp/redis-${BRANCH} && \
		make MALLOC=jemalloc
