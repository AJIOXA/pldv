FROM1 alpine:latest

RUN apk update && apk upgrade
RUN apk add bash
RUN apk add nginx
RUN apk add --upgrade nginx-mod-http-image-filter
RUN adduser -u 1000 -D -S -G www-data www-data
RUN mkdir -p /var/www/html/muzlo
RUN mkdir -p /var/www/html/img

COPY music.mp3 /var/www/html/muzlo
COPY sit.jpg /var/www/html/img
COPY jed.png /var/www/html/img
COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx

RUN chmod 777 /var/www/html/muzlo/music.mp3
RUN chmod 777 /var/www/html/img/sit.jpg
RUN chmod 777 /var/www/html/img/jed.png


EXPOSE 80
EXPOSE 8080
EXPOSE 443

CMD nginx -g "daemon off;"
