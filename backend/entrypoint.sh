#!/bin/bash

cd /opt/tenna-crud && sed -i -e '/DBHOST=/ s/localhost/postgres/' .env

cd /opt/tenna-crud && npm install 
cd /opt/tenna-crud && npm run dev  

while /bin/true
do
    echo "You should not be here. Something went wrong with the node command"
    echo "perhaps doing a docker logs <my container> will help"
    
    sleep 1500
done
