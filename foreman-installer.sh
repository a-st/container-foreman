#!/bin/bash

foreman-installer \
    -l DEBUG \
    --foreman-db-pool 50 \
    --foreman-dynflow-worker-instances 1 \
    --foreman-dynflow-worker-concurrency 1 \
    --foreman-foreman-service-puma-workers 1 \
    --foreman-foreman-service-puma-threads-max 1

exec /bin/bash
