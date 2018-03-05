#!/usr/bin/env bash

docker exec -i test200 /usr/bin/mysql -proot test200 < ./docker/mysql/dumps/admin_default.sql
docker exec -i test200 /usr/bin/mysql -proot test200 -e "UPDATE products SET domain='stagingserver.xyz:8080'"