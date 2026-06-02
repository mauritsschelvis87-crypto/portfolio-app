#!/bin/sh
set -eu

cd "$(dirname "$0")"

echo "Pulling latest portfolio image from Docker Hub..."
docker compose pull portfolio

echo "Restarting portfolio container..."
docker compose up -d portfolio

echo "Done. Portfolio updated."
