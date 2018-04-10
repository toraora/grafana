#!/usr/bin/env bash

mkdir -p docker-home
mkdir -p plugins-bundled/dist dist
rm -f docker-home/.rpmdb/pubkeys/grafana.key
rm -f dist/*

docker run -it \
    -u `id -u`:`id -g` \
    -v `pwd`/docker-home:/home/builduser \
    -v `pwd`:/work \
    -w /work \
    -e HOME=/home/builduser \
    -e GPG_KEY_PASSWORD=957Ky9TYYvxLTn \
    -e GPG_PRIV_KEY="$(cat private.pgp | base64)" \
    -e GPG_PUB_KEY="$(cat factry.gpg | base64)" \
    --entrypoint "" \
    grafana/build-container:1.4.1 \
    ./build.sh