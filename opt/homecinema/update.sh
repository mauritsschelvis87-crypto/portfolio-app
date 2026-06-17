#!/bin/sh
set -eu
cd "$(dirname "$0")"
docker compose pull backend frontend
docker compose up -d
