#!/usr/bin/env bash
set -euo pipefail
cd /home/ubuntu/code/ci-cd/studify-be-test
docker-compose pull
docker-compose up -d
docker image prune -f
docker-compose ps
