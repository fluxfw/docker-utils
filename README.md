# docker-utils

## Installation

Add the files in [HOST_PATH](HOST_PATH) to your PATH

## Commands

### docker-utils-copy-docker-image

```shell
docker-utils-copy-docker-image %from_image% %to_image%
```

### docker-utils-copy-from-docker-image

```shell
docker-utils-copy-from-docker-image %image% /path/in/image /path/on/host
```

### docker-utils-run-in-docker

```shell
docker-utils-run-in-docker %image% %entrypoint% /path/to/folder ...
```

### docker-utils-run-static-webserver

```shell
docker-utils-run-static-webserver /path/to/folder %listen_ip%
```
