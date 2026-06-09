#!/bin/sh
set -eu

cd "$(dirname "$0")"

echo "Checking certificate renewal..."
docker run --rm \
  -v "$(pwd)/certbot/www:/var/www/certbot" \
  -v "$(pwd)/certbot/conf:/etc/letsencrypt" \
  certbot/certbot renew --quiet --webroot --webroot-path=/var/www/certbot

docker exec reverse-proxy nginx -t
docker exec reverse-proxy nginx -s reload

echo "Certificate check done at $(date -Iseconds)"
