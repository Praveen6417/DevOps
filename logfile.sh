#!/bin/bash

logfiles=/tmp/logs 

if [ -d $logfiles ]
then    
    echo "Logs directory is already created"
else
    mkdir $logfiles
    echo "logs directory created at $logfiles"
fi

remove=$(find $logfiles -type f -name "*.log" -mtime +30 -exec ls -l {} \;)

if [ $? -eq 0 ]; then
    echo "Command executed successfully"
else
    echo "Command failed with exit status $?"
fi
