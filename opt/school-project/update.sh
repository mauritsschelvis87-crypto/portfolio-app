#!/bin/sh
set -eu
cd "$(dirname "$0")"
docker compose pull school-project
docker compose up -d school-project
