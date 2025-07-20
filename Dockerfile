FROM ubuntu:latest
LABEL maintainer="pratishtha.servme@gmail.com"

RUN apt-get update && apt-get install -y wget unzip apache2

RUN mkdir -p /var/www/html && \
    wget -O /tmp/photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip /tmp/photogenic.zip -d /var/www/html/ && \
    rm /tmp/photogenic.zip

CMD ["apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80 88
