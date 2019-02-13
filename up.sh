#!/usr/bin/env bash

rm -rf dist/*

npm run build

git add -A dist

git commit -m "up to dokku"

git push dokku master
