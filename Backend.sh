USERID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo "$0" | cut -d "." -f1)
logfile=/tmp/$timestamp-$script_name.log
a=NodeJs

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "$3 $2 is unsuccessful"
        exit 1
    else
        echo "$3 $2 is successful"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Install $a using root access"
    exit 1
else
    echo "You are Super User"
    echo "Installing $a"
fi

dnf update -y &>> $logfile
Validate $? "Updation" 

dnf module disable nodejs -y &>> $logfile
Validate $? "Disable"

dnf module enable nodejs:20 -y &>> $logfile
Validate $? "Enable"

dnf install nodejs -y &>> $logfile
Validate $? "Installation of NodeJS:20"

id expense &>> $logfile
if [ $? -eq 0 ]
then
    echo "Cannot add user Expense"
    echo "Expense user is already exists"
else 
    useradd expense &>> $logfile
    Validate $? "Creating expense user"
fi

mkdir -p /app &>> $logfile
Validate $? "Creating app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>> $logfile
Validate $? "Downloading backend code"

cd /app
rm -rf /app/*
unzip /tmp/backend.zip &>> $logfile
Validate $? "Extracted backend code"

cp /home/ec2-user/DevOps/Backend.service /etc/systemd/system/Backend.service &>> $logfile
Validate $? "Copied backend service"

systemctl daemon-reload &>> $logfile
Validate $? "Daemon Reload"

systemctl start Backend &>> $logfile
Validate $? "Starting backend"

systemctl enable Backend &>> $logfile
Validate $? "Enabling backend"

dnf install mysql -y &>> $logfile
Validate $? "Installing MySQL Client"

mysql -h 172.31.25.139  -u root -p < /app/schema/backend.sql &>> $logfile
Validate $? "Schema loading"

systemctl restart Backend &>> $logfile
Validate $? "Restarting Backend"