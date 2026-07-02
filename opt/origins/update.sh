#!/bin/sh
set -eu
cd "$(dirname "$0")"
docker compose pull origins-game
docker compose up -d origins-game
