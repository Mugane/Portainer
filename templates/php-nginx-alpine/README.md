# PHP-FPM & Nginx on Alpine Linux

## Description

The [Trafex PHP-Apache](https://github.com/TrafeX/docker-php-nginx/tree/master) image with optional version, modules and port configuration.

### Parameters

[tbd]

### Notes

This image has zshell (/bin/sh) and is minimal.

To install custom software in the running container, open a terminal as root using docker exec:
```
docker exec -it -u root [container_id] /bin/sh
```

Applications can be installed using `apk add`, e.g.
```
apk update
apk add nano mlocate htop # install some common utilties
```

### To-do

- Add Options for Composer, xdebug, DNS and Mail?
