FROM alpine:3.20

RUN apk add --no-cache nginx git git-daemon fcgiwrap spawn-fcgi && \
    mkdir -p /var/run/nginx

RUN printf 'server {\n    listen 80;\n    location / {\n        include /etc/nginx/fastcgi_params;\n        fastcgi_param SCRIPT_FILENAME /usr/libexec/git-core/git-http-backend;\n        fastcgi_param GIT_PROJECT_ROOT /var/www/git;\n        fastcgi_param PATH_INFO $uri;\n        fastcgi_pass unix:/var/run/fcgiwrap.sock;\n    }\n}\n' > /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["sh", "-c", "rm -f /var/run/fcgiwrap.sock && export GIT_HTTP_EXPORT_ALL=1 GIT_CONFIG_COUNT=2 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0=* GIT_CONFIG_KEY_1=http.getanyfile GIT_CONFIG_VALUE_1=true && spawn-fcgi -s /var/run/fcgiwrap.sock -U nginx -G nginx -- /usr/bin/fcgiwrap && exec nginx -g 'daemon off;'"]