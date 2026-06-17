#!/bin/sh
set -eu
cd "$(dirname "$0")"
docker compose pull portfolio
docker compose up -d portfolio
