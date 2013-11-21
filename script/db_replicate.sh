#!/bin/sh
 
ssh deployer@192.241.247.215 "pg_dump --inserts -c -b -h localhost -U baway baway_production | gzip -9c" | gunzip -f > tmp/dump.sql \
&& psql -h localhost -U baway baway_development < tmp/dump.sql
