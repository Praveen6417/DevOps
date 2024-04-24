#!/bin/bash
set -e

USERID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo "$0" | cut -d "." -f1)
logfile=/tmp/$timestamp-$script_name.log

error_handling() {
    echo "An error occurred on line $1: $2"
}

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "$3 $2 is unsuccessful"
        exit 1
    else
        echo "$3 $2 is successful"
    fi
}

check_root(){
    if [ $USERID -ne 0 ]
    then
        echo "Install using root access"
        exit 1
    else
        echo "You are Super User"
    fi
}
