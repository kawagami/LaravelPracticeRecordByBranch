#!/bin/sh

cd ../../laradock
docker-compose exec --user=laradock workspace $*
