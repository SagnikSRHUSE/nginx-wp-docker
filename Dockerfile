FROM nginx:stable

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Change NGINX user to www-data
RUN sed -i "s/user\ \ nginx/user\ \ www-data/g" /etc/nginx/nginx.conf
