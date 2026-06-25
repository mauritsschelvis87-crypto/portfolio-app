#!/bin/sh
set -eu
cd "$(dirname "$0")"
mkdir -p certbot/www certbot/conf
docker run --rm \
  -v "$(pwd)/certbot/www:/var/www/certbot" \
  -v "$(pwd)/certbot/conf:/etc/letsencrypt" \
  certbot/certbot certonly \
  --webroot --webroot-path=/var/www/certbot \
  --email "${1:-mauritsschelvis87@gmail.com}" \
  --agree-tos --no-eff-email \
  -d maurits-portfolio.nl \
  -d www.maurits-portfolio.nl \
  -d films.maurits-portfolio.nl \
  -d medical.maurits-portfolio.nl \
  -d school.maurits-portfolio.nl
docker compose up -d
docker exec reverse-proxy nginx -s reload
