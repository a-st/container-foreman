# Run Foreman in a Container

This project aims for running Foreman in a Container, e.g. for quickly fiddling around with Foreman in context of plugin development.

## Debian 13 (Trixie)

```sh
podman build . -t foreman:trixie -f Containerfile.trixie
```
```sh
podman run \
    -p9443:443 \
    -p8443:8443 \
    --tmpfs /tmp \
    --tmpfs /run \
    --tmpfs /run/lock \
    --cgroupns=host \
    -v /sys/fs/cgroup:/sys/fs/cgroup:rw \
    --hostname foreman.example.com \
    --name foreman-trixie \
    -ti foreman:trixie
```

## Ubuntu 24.04 (Noble)
```sh
podman build . -t foreman:noble -f Containerfile.noble
```
```sh
podman run \
    -p9443:443 \
    -p8443:8443 \
    --tmpfs /tmp \
    --tmpfs /run \
    --tmpfs /run/lock \
    --cgroupns=host \
    -v /sys/fs/cgroup:/sys/fs/cgroup:rw \
    --hostname foreman.example.com \
    --name foreman-noble \
    -ti foreman:noble
```

## Additional installer arguments

Additional `foreman-installer` arguments can be passed with `ADDITIONAL_INSTALLER_ARGS`, e.g. for enabling the HDM integration.

```sh
podman run \
    ...
    -e ADDITIONAL_INSTALLER_ARGS='--enable-foreman-plugin-hdm --enable-foreman-proxy-plugin-hdm --foreman-proxy-plugin-hdm-hdm-url <hdm-url> --foreman-proxy-plugin-hdm-hdm-user <hdm-api-user> --foreman-proxy-plugin-hdm-hdm-password <hdm-api-user-password>' \
    ...
```

## Accessing the Foreman server

Access Foreman server using a web browser pointed to https://localhost:9443

Initial credentials will be printed to the logs, e.g.

```
Success!
  * Foreman is running at https://foreman.example.com
      Initial credentials are admin / Lhnp2hojS2xDh6DX
  * Foreman Proxy is running at https://foreman.example.com:8443
```
