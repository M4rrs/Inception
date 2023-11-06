FROM debian:buster

# Install Nginx & SSL 
RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y openssl

# Copy Nginx config file
COPY /conf/default /etc/nginx/sites-available/default
COPY /conf/nginx.conf /etc/nginx/

COPY /tools/script.sh /tools/script.sh

EXPOSE 443

CMD ["tools/script.sh"]