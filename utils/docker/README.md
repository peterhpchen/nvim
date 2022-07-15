# Docker Neovim

Instead of install locally, you can use this Neovim config in the container and volume your workspace to container for development.

## Usages

```sh
docker build -t nvim .
cd /your/prject
docker run -v "$(pwd)":"/root/workspace" -it nvim
```
