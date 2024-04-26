#!/bin/bash

logfiles=/tmp/logs 

if [ -d $logfiles ]
then    
    echo "Logs directory is already created"
else
    mkdir $logfiles
    echo "logs directory created at $logfiles"
fi

find $logfiles -type f -name "*.log" -mtime +30 -exec rm {} \;



