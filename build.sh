#!/bin/sh

curl -LO https://grafana-downloads.storage.googleapis.com/grafana-build-pipeline/v0.5.42/grabpl
chmod +x grabpl

./grabpl build-frontend --jobs 16 --edition oss --no-pull-enterprise
./grabpl build-backend  --jobs 16 --edition oss --no-pull-enterprise --variants linux-x64
./grabpl package        --jobs 16 --edition oss --no-pull-enterprise --variants linux-x64
