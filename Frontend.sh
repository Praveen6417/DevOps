USERID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo "$0" | cut -d "." -f1)
logfile=/tmp/$timestamp-$script_name.log
a=Nginix

Validate(){
    if [ $1 -ne 0 ]
    then
        echo "$3 $2 is unsuccessful"
        exit1
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

dnf install nginx -y &>> $logfile
Validate $? "Nginix" "Insatllation of" 

systemctl enable nginx -y &>> $logfile
Validate $? "Nginix" "Enabling of"

systemctl start nginx -y &>> $logfile
Validate $? "Nginix" "Starting"

rm -rf /usr/share/nginx/html/* $>> $logfile
Validate $? "Removing existing content"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
Validate $? "Downloading Front End Code"

