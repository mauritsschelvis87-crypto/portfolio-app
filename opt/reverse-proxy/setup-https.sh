#!/bin/sh
set -eu

cd "$(dirname "$0")"

EMAIL="${1:-mauritsschelvis87@gmail.com}"

mkdir -p certbot/www certbot/conf

echo "Requesting Let's Encrypt certificate..."
docker run --rm \
  -v "$(pwd)/certbot/www:/var/www/certbot" \
  -v "$(pwd)/certbot/conf:/etc/letsencrypt" \
  certbot/certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email \
  -d maurits-portfolio.nl \
  -d www.maurits-portfolio.nl \
  -d films.maurits-portfolio.nl \
  -d medical.maurits-portfolio.nl

echo "Restarting reverse-proxy with HTTPS..."
docker compose up -d

docker exec reverse-proxy nginx -t
docker exec reverse-proxy nginx -s reload

echo "HTTPS is active for maurits-portfolio.nl and subdomains."
