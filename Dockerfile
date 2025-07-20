FROM ubuntu:latest
LABEL maintainer="pratishtha.servme@gmail.com"


RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean

# Download and extract site
RUN mkdir -p /var/www/html && \
    wget -O /tmp/site.zip https://github.com/startbootstrap/startbootstrap-clean-blog/archive/refs/heads/master.zip && \
    unzip /tmp/site.zip -d /var/www/html/ && \
    rm /tmp/site.zip

# Optional: move content into correct path if needed
RUN mv /var/www/html/startbootstrap-clean-blog-master/* /var/www/html/ && \
    rm -r /var/www/html/startbootstrap-clean-blog-master

CMD ["apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
