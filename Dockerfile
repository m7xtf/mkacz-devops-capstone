
FROM nginx:1.23.2

WORKDIR /tmp

COPY etc/nginx/conf.d/ /etc/nginx/conf.d/
COPY var/www/html/ /var/www/html/

EXPOSE 80/tcp


