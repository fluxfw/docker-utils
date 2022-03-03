# flux-docker-utils

Some util scripts for docker

## Installation

Symlink the files in [.local/bin](.local/bin) somewhere in your "PATH" (Assume ~/.local/bin)

```shell
for f in .local/bin/*; do
  ln -sfT "$PWD/$f" "$HOME/.local/bin/`basename "$f" .sh`"
done
```

## copy_from_docker_image

Copy a folder from a docker image to a local folder

All files are removed on local folder

```shell
copy_from_docker_image %image% /path/in/image relative/local/path
````
