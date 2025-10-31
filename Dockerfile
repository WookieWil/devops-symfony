# syntax=docker/dockerfile:1.4

#############
# Build Stage
#############
FROM composer:2.6 AS composer-builder

WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --optimize-autoloader --no-scripts --no-interaction

COPY . .
RUN composer dump-autoload --optimize --no-dev --classmap-authoritative

###############
# Runtime Stage
###############
FROM php:8.2-fpm-alpine AS runtime

# Install system dependencies
RUN apk add --no-cache \
    nginx \
    supervisor \
    postgresql-dev \
    && docker-php-ext-install pdo pdo_pgsql opcache

# Configure PHP for production
COPY docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

# Configure Nginx
COPY docker/nginx/default.conf /etc/nginx/http.d/default.conf
RUN mkdir -p /var/www/html/public

# Configure Supervisor
COPY docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV APP_ENV=prod
ENV APP_DEBUG=0

# Copy application
WORKDIR /var/www/html
COPY --from=composer-builder /app /var/www/html

RUN mkdir -p var/cache var/log /var/log/supervisor \
    && chown -R www-data:www-data var \
    && chmod -R 775 var

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Container Health Check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1