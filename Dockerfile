FROM nginx:stable

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Change NGINX user to www-data
RUN sed -i "s/user\ \ nginx/user\ \ www-data/g" /etc/nginx/nginx.conf

# Install extra packages

RUN apt-get update -y \
    && apt-get install -y libnginx-mod-http-fancyindex \
    && apt-get install -y libnginx-mod-http-headers-more-filter
