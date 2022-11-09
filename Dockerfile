
#FROM nginx:1.23.2
FROM nginx:latest

WORKDIR /tmp

COPY etc/nginx/conf.d/ /etc/nginx/conf.d/
COPY var/www/html/ /var/www/html/

EXPOSE 80/tcp


