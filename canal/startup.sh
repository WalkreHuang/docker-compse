#!/bin/bash
docker-compose up -d mysql &&
sleep 10 &&
docker exec mysql mysql -uroot -p123456 -e "CREATE USER canal IDENTIFIED BY 'canal';" &&
docker exec mysql mysql -uroot -p123456 -e "GRANT SELECT, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'canal'@'%';" &&
docker-compose up -d canal
