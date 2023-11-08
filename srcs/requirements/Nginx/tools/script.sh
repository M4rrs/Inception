#!/bin/bash

# Generate a self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTS_ -subj "/C=MY/ST=Selangor/L=Sunway/O=42 Malaysia/OU=Student/CN=Mars"

# Prevents nginx from running in the background as a daemon process
# Considered as best practice for Docker containers, one container = one process.
# By running nginx in the foreground, the Docker container remains alive for as long as the webserver is running.
nginx -g "daemon off;"