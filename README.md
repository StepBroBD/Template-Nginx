# Template - Nginx

![GitHub Action Status](https://github.com/StepBroBD/Template-Nginx/actions/workflows/Workflow.yml/badge.svg)

Nginx configuration template.

## Mapping

In this defined Nginx configuration, all unsecure requests send to `:80` will be redirected to `:443` (see `default.conf`).

Then, secure requests will be handled based on requested domain.

### `https://yifei.page` and `https://www.yifei.page`

For public accessible `https://yifei.page` and `https://www.yifei.page`, local Docker container have universal resource identifier
of `http://localhost:10000`.

### `https://s.yifei.page` and `https://serve.yifei.page`

For public accessible `https://s.yifei.page` and `https://serve.yifei.page`, local Docker container have universal resource identifier
of `http://localhost:10001`.

### `https://y.yifei.page` and `https://yellow.yifei.page`

For public accessible `https://y.yifei.page` and `https://yellow.yifei.page`, local Docker container have universal resource identifier
of `http://localhost:10002`.

## Linking

Use symlink to direct `sites-available` configurations to `sites-enabled`.

```shell
ln -fsv /etc/nginx/sites-available/<filename> /etc/nginx/sites-enabled/<filename>
```

## License

This repository content excluding all submodules is licensed under the [WTFPL License](LICENSE.md), third-party code are
subject to their original license.
