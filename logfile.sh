#!/bin/bash

logfiles=/tmp/logs 

if [ -d $logfiles ]
then    
    echo "Logs directory is already created"
else
    mkdir logs
    echo "logs directory created at $logfiles"
    exit 1
fi

remove=$(find -type f -name "*.log" -mtime +30)

echo $remove