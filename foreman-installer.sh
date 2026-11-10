#!/bin/bash

export FOREMAN_LOG_LEVEL=${FOREMAN_LOG_LEVEL:=notice}
export FOREMAN_DB_POOL=${FOREMAN_DB_POOL:=50}
export FOREMAN_DYNFLOW_WORKER_INSTANCES=${FOREMAN_DYNFLOW_WORKER_INSTANCES:=1}
export FOREMAN_DYNFLOW_WORKER_CONCURRENCY=${FOREMAN_DYNFLOW_WORKER_CONCURRENCY:=1}
export FOREMAN_SERVICE_PUMA_WORKERS=${FOREMAN_SERVICE_PUMA_WORKERS:=1}
export FOREMAN_SERVICE_PUMA_THREADS_MAX=${FOREMAN_SERVICE_PUMA_THREADS_MAX:=1}
export FOREMAN_ADDITIONAL_INSTALLER_ARGS=${FOREMAN_ADDITIONAL_INSTALLER_ARGS:=}

log-and-run() {
    echo -E ":: Running $@"
    $@
}

log-and-run foreman-installer \
    --verbose-log-level ${FOREMAN_LOG_LEVEL} \
    --foreman-db-pool ${FOREMAN_DB_POOL} \
    --foreman-dynflow-worker-instances ${FOREMAN_DYNFLOW_WORKER_INSTANCES} \
    --foreman-dynflow-worker-concurrency ${FOREMAN_DYNFLOW_WORKER_CONCURRENCY} \
    --foreman-foreman-service-puma-workers ${FOREMAN_SERVICE_PUMA_WORKERS} \
    --foreman-foreman-service-puma-threads-max ${FOREMAN_SERVICE_PUMA_THREADS_MAX} \
    --enable-foreman-plugin-openbolt \
    --enable-foreman-proxy-plugin-openbolt \
    ${FOREMAN_ADDITIONAL_INSTALLER_ARGS}

exec /bin/bash
