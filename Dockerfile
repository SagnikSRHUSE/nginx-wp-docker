FROM debian:buster-slim

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Change NGINX user to www-data
RUN sed -i "s/user\ \ nginx/user\ \ www-data/g" /etc/nginx/nginx.conf

# Install NGINX packages

RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get install -y libnginx-mod-http-fancyindex \
    && apt-get install -y libnginx-mod-http-headers-more-filter

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
