#!/bin/bash

logfiles=/tmp/logs 

if [ -d $logfiles ]
then    
    echo "Logs directory is already created"
    exit 1
else
    mkdir $logfiles
    echo "logs directory created at $logfiles"
fi

remove=$(find $logfiles -type f -name "*.log" -mtime +30)

echo $remove