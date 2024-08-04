# PHP-FPM & Nginx on Alpine Linux

## Description

The [Trafex PHP-Apache](https://github.com/TrafeX/docker-php-nginx/tree/master) image with optional version, modules and port configuration.

### Parameters

A domain name is required to correctly set up SSL certificates via the Traefik reverse proxy.

A Traefik container is required with a `traefik` network to join.

### Notes

This image has zshell (/bin/sh) and is minimal which could causee some issues if you need to manage the server in development.

Need to test this deploy since the Trafex port is usually 8080 not 80.

### To-do

- Add Options for Composer, xdebug, DNS and Mail?
