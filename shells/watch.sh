#!/bin/sh

cd ../../laradock
# docker-compose up -d nginx mysql
docker-compose exec --user=laradock workspace npm run watch