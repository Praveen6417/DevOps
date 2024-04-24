#!/bin/bash

source ./common.sh

check_root

dnf update -y &>> $logfile

dnf module disable nodejs -y &>> $logfile

dnf module enable nodejs:20 -y &>> $logfile

dnf install nodejs -y &>> $logfile

id expense &>> $logfile
if [ $? -eq 0 ]
then
    echo "Cannot add user Expense"
    echo "Expense user is already exists"
else 
    useradd expense &>> $logfile
fi

mkdir -p /app &>> $logfile

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>> $logfile

cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>> $logfile

npm install &>> $logfile

cp /home/ec2-user/DevOps/Backend.service /etc/systemd/system/Backend.service &>> $logfile

systemctl daemon-reload &>> $logfile

systemctl start Backend &>> $logfile

systemctl enable Backend &>> $logfile

dnf install mysql -y &>> $logfile

mysql -h 172.31.27.12  -u root -p < /app/schema/backend.sql &>> $logfile

systemctl restart Backend &>> $logfile