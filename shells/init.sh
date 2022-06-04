#!/bin/sh

# absolution path
file=$(readlink -f $0)
file_location=$(dirname $file)
cd $file_location

# unzip laradock setting
tar -zxvf laradockSetting.tar.gz -C ../..

# open vscode
cd ..
code .

# up service & install lib
cd ../laradock
docker-compose down
docker-compose up -d nginx mysql
docker-compose exec --user=laradock workspace cp .env.example .env
docker-compose exec workspace chmod -R 777 storage bootstrap/cache
docker-compose exec --user=laradock workspace composer install
docker-compose exec --user=laradock workspace composer update
docker-compose exec --user=laradock workspace php artisan key:generate
docker-compose exec --user=laradock workspace npm install
docker-compose exec --user=laradock workspace npm update

# docker-compose exec workspace php artisan migrate --seed
# docker-compose exec workspace php artisan db:seed --class=PermissionTableSeeder

# docker-compose exec --user=laradock workspace php artisan make:controller /backdoor/VueController -r
# docker-compose exec --user=laradock workspace npm install
# docker-compose exec --user=laradock workspace npm update
# docker-compose exec --user=laradock workspace npm install sass-loader@^12.1.0 sass resolve-url-loader@^5.0.0 --save-dev --legacy-peer-deps

# docker-compose exec --user=laradock workspace npm run watch