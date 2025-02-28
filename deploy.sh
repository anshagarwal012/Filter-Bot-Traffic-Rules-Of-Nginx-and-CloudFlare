#!/bin/bash

# Define the URL and destination file
CONF_URL="https://raw.githubusercontent.com/anshagarwal012/Filter-Bot-Traffic-Rules-Of-Nginx-and-CloudFlare/refs/heads/main/nginx.conf"
NGINX_CONF="/etc/nginx/nginx.conf"

# Download the new configuration file
curl -sSL "$CONF_URL" -o "$NGINX_CONF"

# Test the Nginx configuration
nginx -t

# Check if the test was successful
if [ $? -eq 0 ]; then
    echo "Nginx configuration is valid. Restarting Nginx..."
    systemctl restart nginx
else
    echo "Nginx configuration test failed. Not restarting Nginx."
    exit 1
fi
