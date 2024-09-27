FROM nginx:latest

ENV NGINX_ROOT /usr/src/app/public
ENV NGINX_FPM_HOST localhost
ENV NGINX_FPM_PORT 9000

COPY ./.docker/nginx/fpm-template.conf /etc/nginx/fpm.tmpl
COPY ./.docker/nginx/bin/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8081

ENTRYPOINT ["entrypoint.sh"]
