ARG PHP_VERSION=latest

# ---- stage 1: apt cache ----
FROM docker.io/php:${PHP_VERSION} AS apt
RUN apt-get update

# ---- stage 2: tool ----
FROM docker.io/php:${PHP_VERSION} AS tool
COPY --from=apt /var/lib/apt/lists/ /var/lib/apt/lists/
RUN curl -sSLf https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o /usr/local/bin/install-php-extensions
RUN chmod +x /usr/local/bin/install-php-extensions

# ---- stage 3: extensions ----
FROM docker.io/php:${PHP_VERSION} AS extensions
ARG PHP_EXTENSIONS=""
COPY --from=apt  /var/lib/apt/lists/ /var/lib/apt/lists/
COPY --from=tool /usr/local/bin/install-php-extensions /usr/local/bin/install-php-extensions
RUN if [ -n "$PHP_EXTENSIONS" ]; then \
      install-php-extensions $PHP_EXTENSIONS; \
    fi

# ---- stage 4: runtime ----
FROM docker.io/php:${PHP_VERSION} AS runtime
ARG APACHE_SERVER_NAME=localhost
COPY --from=extensions /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=extensions /usr/local/etc/php/conf.d/     /usr/local/etc/php/conf.d/
RUN a2enmod rewrite 
RUN if ! grep -q 'ServerName' /etc/apache2/apache2.conf; then \
      echo "ServerName ${APACHE_SERVER_NAME}" >> /etc/apache2/apache2.conf; \
    else \
      sed -i "s/^ServerName .*/ServerName ${APACHE_SERVER_NAME}/" /etc/apache2/apache2.conf; \
    fi
CMD ["apache2-foreground"]