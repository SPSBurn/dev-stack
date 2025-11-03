#!/bin/bash
mkdir -p dump
docker exec db_mysql mysqldump -u admin -padmin --all-databases > dump/backup_$(date +%Y%m%d_%H%M%S).sql