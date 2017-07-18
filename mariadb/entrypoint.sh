#!/bin/bash
/docker-entrypoint.sh mysqld &
MYSQLD_PID=$!
sleep 10
echo -e "\n -> Importing Polypus schemes..."
mysql -u dpsa -pdpsa --database dpsa < polypus_rm.sql \
&& echo -e " -> Schemes imported successfully!\n"
wait $MYSQLD_PID
