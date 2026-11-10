#!/bin/bash

foreman-installer \
    -l DEBUG \
    --foreman-db-pool 50 \
    --foreman-dynflow-worker-instances 1 \
    --foreman-dynflow-worker-concurrency 1 \
    --foreman-foreman-service-puma-workers 1 \
    --foreman-foreman-service-puma-threads-max 1 \
    --enable-foreman-plugin-hdm \
    --enable-foreman-proxy-plugin-hdm \
    --foreman-proxy-plugin-hdm-hdm-url http://hdm:3000 \
    --foreman-proxy-plugin-hdm-hdm-user api \
    --foreman-proxy-plugin-hdm-hdm-password apiapiapi

exec /bin/bash
