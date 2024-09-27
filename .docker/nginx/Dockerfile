FROM nginx:latest

ENV NGINX_ROOT /var/www/public
ENV NGINX_FPM_HOST app
ENV NGINX_FPM_PORT 9000

COPY ./.docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8081
