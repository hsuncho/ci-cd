#!/usr/bin/env bash
set -euo pipefail

# GHCR 계정명
GHCR_USER="hsuncho"

# 이미지 ID 확인 후 각 서비스에 태그 붙이기
echo "태그 붙이는 중..."
docker tag 9b847e351517 ghcr.io/${GHCR_USER}/eureka-server:latest
docker tag e48eff1b0aed ghcr.io/${GHCR_USER}/api-gateway:latest
docker tag 190fc1fbfcaf ghcr.io/${GHCR_USER}/user-service:latest
docker tag 5c9c6c51874f ghcr.io/${GHCR_USER}/post-service:latest
docker tag 2570b73e7e0d ghcr.io/${GHCR_USER}/notification-service:latest

echo "GHCR 로그인 필요"
docker login ghcr.io -u ${GHCR_USER}

echo "이미지 push 시작..."
docker push ghcr.io/${GHCR_USER}/eureka-server:latest
docker push ghcr.io/${GHCR_USER}/api-gateway:latest
docker push ghcr.io/${GHCR_USER}/user-service:latest
docker push ghcr.io/${GHCR_USER}/post-service:latest
docker push ghcr.io/${GHCR_USER}/notification-service:latest

echo "모든 이미지 GHCR push 완료!"

