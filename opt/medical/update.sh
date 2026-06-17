#!/bin/sh
set -eu
cd "$(dirname "$0")"
docker compose pull ai-service backend frontend
docker compose up -d
docker exec reverse-proxy nginx -s reload 2>/dev/null || true
