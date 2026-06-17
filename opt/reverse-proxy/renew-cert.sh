#!/bin/sh
set -eu
cd "$(dirname "$0")"
docker run --rm \
  -v "$(pwd)/certbot/www:/var/www/certbot" \
  -v "$(pwd)/certbot/conf:/etc/letsencrypt" \
  certbot/certbot renew --quiet --webroot --webroot-path=/var/www/certbot
docker exec reverse-proxy nginx -s reload
