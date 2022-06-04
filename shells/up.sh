#!/bin/sh

cd ..
code .

cd ../laradock
docker-compose up -d mysql nginx
docker-compose exec --user=laradock workspace npm run watch
