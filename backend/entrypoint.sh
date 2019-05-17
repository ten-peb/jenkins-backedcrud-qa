#!/bin/bash

cd /opt/tenna-crud/app/www && npm install 
node /opt/tenna-crud/app/www

while /bin/true
do
    echo "You should not be here. Something went wrong with the node command"
    echo "perhaps doing a docker logs <my container> will help"
    
    sleep 1500
done
