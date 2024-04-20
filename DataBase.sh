USERID=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
script_name=$(echo "$0" | cut -d "." -f1)
logfile=/tmp/$timestamp-$script_name.log
a=MySQL

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

dnf install mysql-server -y &>> logfile
Validate $? "MySQL-Server" "Installation of"

systemctl enable mysqld &>> logfile
Validate $? "MySQL-Server" "Enabling of"

systemctl start mysqld &>> logfile
Validate $? "MySQL-Server" "Starting of"

mysql -h 54.226.116.134 -u root -p -e 'show databases;' &>>$logfile

# Validate if MySQL root password is already set or updated
mysql -u root -p -e ";"  # Attempt to connect to MySQL

if [ $? -eq 0 ]; then
    echo "MySQL root password is already set or updated."
    exit 1
else
    echo "Setting MySQL root password..."
    mysql_secure_installation --set-root-pass -p
    if [ $? -eq 0 ]; then
        echo "MySQL root password set successfully."
    else
        echo "Failed to set MySQL root password."
        exit 1
    fi
fi
