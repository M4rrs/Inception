FROM debian:buster

# Install Nginx & SSL 
RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y openssl

# Copy Nginx config file
COPY ./srcs/requirements/Nginx/conf/nginx.conf /etc/nginx/sites-available/default

