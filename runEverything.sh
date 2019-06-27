#!/usr/bin/env bash

function getContainerHealth {
  docker inspect --format "{{json .State.Health.Status }}" $1
}

function waitContainer {
  printf "waiting for mysql container to be ready"
  while STATUS=$(getContainerHealth $1); [ $STATUS != "\"healthy\"" ]; do
    if [ $STATUS == "\"unhealthy\"" ]; then
      echo "Failed!"
      exit -1
    fi
    printf .
    lf=$'\n'
    sleep 1
  done
  printf "$lf"
}




docker kill setting-mysqldb && docker rm setting-mysqldb

docker run --name=setting-mysqldb -d \
-p 3306:3306 \
-e MYSQL_ROOT_HOST=% \
-e MYSQL_ROOT_PASSWORD=ir0n27 \
-e MYSQL_DATABASE=wm_setting \
--health-cmd='mysqladmin ping --silent' \
mysql/mysql-server:5.7.24

mvn clean install &

waitContainer setting-mysqldb

mvn flyway:migrate -Dflyway.url=jdbc:mysql://127.0.0.1:3306/wm_setting -Dflyway.user=root -Dflyway.password=ir0n27

mvn spring-boot:run