# flux-docker-utils

Some util scripts for docker

## Installation

```shell
./bin/install-to-home-local-bin.sh
```

## Commands

### copy-docker-image

```shell
copy-docker-image %from_image% %to_image%
```

### copy-from-docker-image

```shell
copy-from-docker-image %image% /path/in/image relative/local/path
```

### run-in-docker

```shell
run-in-docker %image% %entrypoint% ...
```

### run-static-webserver

```shell
run-static-webserver %listen_ip%
```
